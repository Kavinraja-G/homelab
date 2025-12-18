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
    endpoint        = "192.168.20.115"
    gateway         = "192.168.20.1"
    talos_version   = "v1.11.5"
    proxmox_cluster = "homelab"
  }

  nodes = {
    "cp-node-01" = {
      host_node     = "cp-node-01"
      machine_type  = "controlplane"
      ip            = "192.168.20.115"
      mac_address   = "BC:24:11:2E:C7:01"
      vm_id         = 701
      datastore_id  = "local-lvm"
      cpu           = 4
      ram_dedicated = 8192
    }
    "cp-node-02" = {
      host_node     = "cp-node-02"
      machine_type  = "controlplane"
      ip            = "192.168.20.125"
      mac_address   = "BC:24:11:2E:C7:02"
      vm_id         = 702
      datastore_id  = "local-lvm"
      cpu           = 4
      ram_dedicated = 8192
    }
    "cp-node-03" = {
      host_node     = "node-01"
      machine_type  = "controlplane"
      ip            = "192.168.20.135"
      mac_address   = "BC:24:11:2E:C7:03"
      vm_id         = 703
      datastore_id  = "local-lvm"
      cpu           = 2
      ram_dedicated = 4096
    }
    "worker-01" = {
      host_node     = "node-01"
      machine_type  = "worker"
      ip            = "192.168.20.140"
      mac_address   = "BC:24:11:2E:C8:01"
      vm_id         = 801
      datastore_id  = "local-lvm"
      cpu           = 2
      ram_dedicated = 8192
    }
  }
}