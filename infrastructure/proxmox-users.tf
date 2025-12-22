# Read-only API user for Proxmox x K8s integration
resource "proxmox_virtual_environment_user" "api_ro_user" {
  user_id = "api-ro-user@pve"
  acl {
    path      = "/"
    propagate = true
    role_id   = "PVEAuditor"
  }
}

resource "proxmox_virtual_environment_user_token" "api_ro_user_token" {
  comment               = "Managed by Tofu used for K8s Proxmox RO access"
  token_name            = "k8s"
  user_id               = proxmox_virtual_environment_user.api_ro_user.user_id
  privileges_separation = false
}

resource "bitwarden_secret" "pmx_api_ro_user_token" {
  key        = "pmx-api-ro-user-token"
  value      = proxmox_virtual_environment_user_token.api_ro_user_token.value
  project_id = data.bitwarden_project.homelab.id
  note       = "Managed by Tofu used for K8s Proxmox RO access"
}

# Proxmox CSI Roles, Users & Token for K8s
resource "proxmox_virtual_environment_role" "csi" {
  role_id = "CSI"
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
  user_id = "homelab-k8s-csi@pve"
  acl {
    path      = "/"
    propagate = true
    role_id   = proxmox_virtual_environment_role.csi.role_id
  }
}

resource "proxmox_virtual_environment_user_token" "kubernetes_csi_user_token" {
  comment               = "Managed by Tofu used for K8s Proxmox RO access"
  token_name            = "k8s-csi"
  user_id               = proxmox_virtual_environment_user.kubernetes_csi.user_id
  privileges_separation = false
}

resource "bitwarden_secret" "kubernetes_csi_user_token" {
  key        = "pmx-k8s-csi-user-token"
  value      = proxmox_virtual_environment_user_token.kubernetes_csi_user_token.value
  project_id = data.bitwarden_project.homelab.id
  note       = "Managed by Tofu used for K8s Proxmox CSI"
}