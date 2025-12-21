resource "proxmox_virtual_environment_role" "csi" {
  role_id    = "CSI"
  privileges = [
    "Sys.Audit",
    "VM.Audit",
    "VM.Config.Disk",
    "Datastore.Allocate",
    "Datastore.AllocateSpace",
    "Datastore.Audit"
  ]
}

resource "proxmox_virtual_environment_user" "kubernetes_csi" {
  user_id  = "homelab-k8s-csi@pve"
  acl {
    path      = "/"
    propagate = true
    role_id   = proxmox_virtual_environment_role.csi.role_id
  }
}
