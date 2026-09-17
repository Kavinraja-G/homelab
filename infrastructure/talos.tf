module "talos" {
  source = "./modules/talos-baremetal"

  cluster = {
    name                = "homelab-k8s"
    endpoint            = "192.168.20.205"
    talos_version       = "v1.14.0"
    installer_image     = "factory.talos.dev/metal-installer/376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba:v1.14.0"
    kubernetes_version  = var.kubernetes_version
    control_plane_nodes = ["192.168.20.200", "192.168.20.201", "192.168.20.203"]
    worker_nodes        = []
  }

  cilium = {
    version = "1.18.4"
    values  = file("${path.module}/../kubernetes/system/cilium/values.yaml")
  }

  nodes = {
    "cp-01" = {
      ip                = "192.168.20.200"
      machine_type      = "controlplane"
      hostname          = "homelab-k8s-cp01"
      install_disk      = "/dev/sda"
      network_interface = "eno1"
    }
    "cp-02" = {
      ip                = "192.168.20.201"
      machine_type      = "controlplane"
      hostname          = "homelab-k8s-cp02"
      install_disk      = "/dev/nvme0n1"
      network_interface = "eno1"
    }
    "cp-03" = {
      ip                = "192.168.20.203"
      machine_type      = "controlplane"
      hostname          = "homelab-k8s-cp03"
      install_disk      = "/dev/sda"
      network_interface = "eno1"
    }
  }
}