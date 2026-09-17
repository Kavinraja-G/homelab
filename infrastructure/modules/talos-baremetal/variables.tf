variable "cluster" {
  description = "Bare-metal Talos cluster details"
  type = object({
    name                = string
    endpoint            = string
    talos_version       = string
    installer_image     = string
    kubernetes_version  = string
    control_plane_nodes = list(string)
    worker_nodes        = list(string)
  })
}

variable "nodes" {
  description = "Bare-metal nodes which start in Talos maintenance mode"
  type = map(object({
    ip                = string
    machine_type      = string
    hostname          = string
    install_disk      = string
    network_interface = string
  }))
}

variable "cilium" {
  description = "Cilium bootstrap settings"
  type = object({
    version = string
    values  = string
  })
}
