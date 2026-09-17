variable "kubernetes_version" {
  default     = "v1.37.0"
  description = "Kubernetes Version"
}

variable "bitwarden_access_token" {
  description = "Bitwarden Secrets Manager Machine account access token"
  sensitive   = true
}

variable "flux_git_token" {
  description = "GitHub token used by Flux to read the repository over HTTPS"
  sensitive   = true
  type        = string
}