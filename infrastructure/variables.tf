variable "proxmox" {
  type = object({
    name         = string
    cluster_name = string
    endpoint     = string
    insecure     = bool
    username     = string
    api_token    = string
  })
  sensitive = true
}

variable "github" {
  type = object({
    org        = string
    repository = string
  })
}

variable "github_token" {
  description = "GitHub PAT"
  sensitive   = true
}