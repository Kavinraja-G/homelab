module "flux_operator_bootstrap" {
  depends_on = [module.talos]

  source  = "controlplaneio-fluxcd/flux-operator-bootstrap/kubernetes"
  version = "0.8.0"

  revision = 1

  gitops_resources = {
    instance_yaml = file("${path.module}/../kubernetes/clusters/homelab/flux-system/flux-instance.yaml")
  }

  managed_resources = {
    secrets_yaml = <<-YAML
      apiVersion: v1
      kind: Secret
      metadata:
        name: flux-system
        namespace: flux-system
      type: Opaque
      stringData:
        username: git
        password: ${var.flux_git_token}
    YAML
  }

  job = {
    host_network = true
    tolerations = [{
      key      = "node-role.kubernetes.io/control-plane"
      operator = "Exists"
      effect   = "NoSchedule"
    }]
  }
}