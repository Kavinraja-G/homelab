# HomeLab Infrastructure

All my homelab infrastructure are deployed via [OpenTofu](https://opentofu.org). Agree, it's overkill. But why not? if it's fun and put your brain to work. :)

## Overview

Deploys the following components:
1. [Talos](https://docs.siderolabs.com/talos) based K8s cluster on existing bare-metal nodes.
2. Bootstraps K8s cluster with FluxCD components and intializes the [monorepo](../kubernetes/clusters/homelab/).
3. Injects Bitwarden Secrets.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_bitwarden"></a> [bitwarden](#requirement\_bitwarden) | >= 0.16.0 |
| <a name="requirement_flux"></a> [flux](#requirement\_flux) | 1.7.6 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.9.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 3.0.1 |
| <a name="requirement_talos"></a> [talos](#requirement\_talos) | 0.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_bitwarden"></a> [bitwarden](#provider\_bitwarden) | 0.16.0 |
| <a name="provider_flux"></a> [flux](#provider\_flux) | 1.7.6 |
| <a name="provider_github"></a> [github](#provider\_github) | 6.9.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.6.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_talos"></a> [talos](#module\_talos) | ./modules/talos-baremetal | n/a |

## Resources

| Name | Type |
|------|------|
| [bitwarden_secret.kubernetes_csi_user_token](https://registry.terraform.io/providers/maxlaverse/bitwarden/latest/docs/resources/secret) | resource |
| [bitwarden_secret.pmx_api_ro_user_token](https://registry.terraform.io/providers/maxlaverse/bitwarden/latest/docs/resources/secret) | resource |
| [flux_bootstrap_git.flux](https://registry.terraform.io/providers/fluxcd/flux/1.7.6/docs/resources/bootstrap_git) | resource |
| [github_repository_deploy_key.flux](https://registry.terraform.io/providers/hashicorp/github/6.9.0/docs/resources/repository_deploy_key) | resource |
| [local_file.kube_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.machine_configs](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.talos_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.flux](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bitwarden_access_token"></a> [bitwarden\_access\_token](#input\_bitwarden\_access\_token) | Bitwarden Secrets Manager Machine account access token | `any` | n/a | yes |
| <a name="input_github"></a> [github](#input\_github) | GitHub Repository Information | ```object({ org = string repository = string })``` | n/a | yes |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | GitHub Token | `any` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes Version | `string` | `"v1.37.0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_talos_config"></a> [talos\_config](#output\_talos\_config) | n/a |
<!-- END_TF_DOCS -->
