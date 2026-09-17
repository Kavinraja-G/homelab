terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.2.1"
    }
    talos = {
      source  = "siderolabs/talos"
      version = ">= 0.11.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = ">= 0.16.0"
    }
  }
}

provider "kubernetes" {
  host                   = module.talos.kube_config.kubernetes_client_configuration.host
  client_certificate     = base64decode(module.talos.kube_config.kubernetes_client_configuration.client_certificate)
  client_key             = base64decode(module.talos.kube_config.kubernetes_client_configuration.client_key)
  cluster_ca_certificate = base64decode(module.talos.kube_config.kubernetes_client_configuration.ca_certificate)
}

provider "helm" {
  kubernetes = {
    host                   = module.talos.kube_config.kubernetes_client_configuration.host
    client_certificate     = base64decode(module.talos.kube_config.kubernetes_client_configuration.client_certificate)
    client_key             = base64decode(module.talos.kube_config.kubernetes_client_configuration.client_key)
    cluster_ca_certificate = base64decode(module.talos.kube_config.kubernetes_client_configuration.ca_certificate)
  }
}

provider "bitwarden" {
  access_token          = var.bitwarden_access_token
  client_implementation = "embedded"
}