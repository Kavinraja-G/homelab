resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "github_repository_deploy_key" "flux" {
  title      = "Flux"
  repository = var.github.repository
  key        = tls_private_key.flux.public_key_openssh
  read_only  = "false"
}

resource "flux_bootstrap_git" "flux" {
  depends_on = [github_repository_deploy_key.flux, module.talos]

  version                = "v2.7.5"
  embedded_manifests     = true
  kustomization_override = file("${path.module}/manifests/flux-kustomization-patch.yaml")
  path                   = "kubernetes/clusters/homelab"
}