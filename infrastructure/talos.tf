module "talos" {
  source = "./modules/talos"

  providers = {
    proxmox = proxmox
  }

  image = {
    version   = var.talos_version
    schematic = file("${path.module}/modules/talos/configs/image-schematic.yaml")
  }

  cilium = {
    install = file("${path.module}/modules/talos/manifests/cilium.yaml")
    values  = file("${path.module}/../kubernetes/system/cilium/values.yaml")
  }

  cluster = {
    name            = "homelab-k8s"
    endpoint        = "192.168.0.70"
    gateway         = "192.168.0.1"
    talos_version   = "v1.11.5"
    proxmox_cluster = "homelab"
  }

  nodes = {
    "controlplane-01" = {
      host_node     = "thinkcentre-01"
      machine_type  = "controlplane"
      ip            = "192.168.0.70"
      mac_address   = "BC:24:11:2E:C7:01"
      vm_id         = 701
      datastore_id  = "local-lvm"
      cpu           = 4
      ram_dedicated = 8192
    }
    "worker-01" = {
      host_node     = "sff-linux-01"
      machine_type  = "worker"
      ip            = "192.168.0.80"
      mac_address   = "BC:24:11:2E:C7:02"
      vm_id         = 801
      datastore_id  = "local-lvm"
      cpu           = 4
      ram_dedicated = 8192
    }
  }
}