locals {
  control_plane_nodes = var.cluster.control_plane_nodes
  worker_nodes        = var.cluster.worker_nodes
  all_nodes           = concat(local.control_plane_nodes, local.worker_nodes)
  control_plane_node  = local.control_plane_nodes[0]
  node_by_ip          = { for name, node in var.nodes : node.ip => name }
}

resource "talos_machine_secrets" "this" {
  talos_version = var.cluster.talos_version
}

data "talos_client_configuration" "this" {
  cluster_name         = var.cluster.name
  client_configuration = talos_machine_secrets.this.client_configuration
  nodes                = local.all_nodes
  endpoints            = local.control_plane_nodes
}

data "talos_machine_configuration" "this" {
  for_each = var.nodes

  cluster_name       = var.cluster.name
  cluster_endpoint   = "https://${var.cluster.endpoint}:6443"
  talos_version      = var.cluster.talos_version
  kubernetes_version = var.cluster.kubernetes_version
  machine_type       = each.value.machine_type
  machine_secrets    = talos_machine_secrets.this.machine_secrets

  config_patches = [
    templatefile(
      each.value.machine_type == "controlplane" ? "${path.module}/configs/control-plane.yaml.tftpl" : "${path.module}/configs/worker.yaml.tftpl",
      {
        cluster_name      = var.cluster.name
        cluster_vip       = var.cluster.endpoint
        hostname          = each.value.hostname
        installer_image   = var.cluster.installer_image
        install_disk      = each.value.install_disk
        network_interface = each.value.network_interface
        node_name         = each.key
        cilium_values     = var.cilium.values
        cilium_bootstrap  = templatefile("${path.module}/configs/cilium-bootstrap.yaml.tftpl", { cilium_version = var.cilium.version })
      }
    )
  ]
}

resource "talos_machine_configuration_apply" "this" {
  for_each = var.nodes

  node                        = each.value.ip
  client_configuration        = data.talos_client_configuration.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.this[each.key].machine_configuration
  apply_mode                  = "auto"
}

resource "talos_machine_bootstrap" "this" {
  depends_on = [talos_machine_configuration_apply.this]

  node                 = local.control_plane_node
  endpoint             = local.control_plane_node
  client_configuration = data.talos_client_configuration.this.client_configuration
}

data "talos_cluster_health" "this" {
  depends_on = [talos_machine_bootstrap.this]

  client_configuration = data.talos_client_configuration.this.client_configuration
  control_plane_nodes  = local.control_plane_nodes
  worker_nodes         = local.worker_nodes
  endpoints            = local.control_plane_nodes

  timeouts = {
    read = "10m"
  }
}

resource "talos_cluster_kubeconfig" "this" {
  depends_on = [data.talos_cluster_health.this]

  client_configuration = data.talos_client_configuration.this.client_configuration
  node                 = local.control_plane_node
}
