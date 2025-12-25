# Talos x Proxmox Module
OpenTofu module to deploy Talos based K8s cluster in Proxmox VEs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | >=0.89.0 |
| <a name="requirement_talos"></a> [talos](#requirement\_talos) | >=0.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | >=0.89.0 |
| <a name="provider_talos"></a> [talos](#provider\_talos) | >=0.9.0 |

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_download_file.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_download_file) | resource |
| [proxmox_virtual_environment_vm.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm) | resource |
| [talos_machine_bootstrap.this](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/machine_bootstrap) | resource |
| [talos_machine_configuration_apply.this](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/machine_configuration_apply) | resource |
| [talos_machine_secrets.this](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/machine_secrets) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cilium"></a> [cilium](#input\_cilium) | Cilium configuration | ```object({ values = string install = string })``` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Cluster configuration | ```object({ name = string endpoint = string gateway = string talos_version = string proxmox_cluster = string })``` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | Talos image configuration | ```object({ factory_url = optional(string, "https://factory.talos.dev") schematic = string version = string update_schematic = optional(string) update_version = optional(string) arch = optional(string, "amd64") platform = optional(string, "nocloud") proxmox_datastore = optional(string, "local") })``` | n/a | yes |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | Configuration for cluster nodes | ```map(object({ host_node = string machine_type = string datastore_id = optional(string, "local-zfs") ip = string mac_address = string vm_id = number cpu = number ram_dedicated = number update = optional(bool, false) igpu = optional(bool, false) }))``` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_configuration"></a> [client\_configuration](#output\_client\_configuration) | Talos client configuration details |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | Generated Kubeconfig for the Talos cluster |
| <a name="output_machine_config"></a> [machine\_config](#output\_machine\_config) | Generated Machine configs for the Talos |
<!-- END_TF_DOCS -->

---
*Module insipred by [vehagn](https://gitlab.com/vehagn/blog/-/tree/main/content/articles/2024/08/talos-proxmox-tofu)!*