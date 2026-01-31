variable "talos_version" {
  default     = "v1.12.2"
  description = "Talos Image Version"
}

variable "proxmox" {
  type = object({
    name         = string
    cluster_name = string
    endpoint     = string
    insecure     = bool
    username     = string
    api_token    = string
  })
  description = "Proxmox Cluster configs"
  sensitive   = true
}

variable "github" {
  type = object({
    org        = string
    repository = string
  })
  description = "GitHub Repository Information"
}

variable "github_token" {
  description = "GitHub Token"
  sensitive   = true
}

variable "bitwarden_access_token" {
  description = "Bitwarden Secrets Manager Machine account access token"
  sensitive   = true
}