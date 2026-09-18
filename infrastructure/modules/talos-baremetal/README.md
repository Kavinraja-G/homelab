## Overview

This module provisions a bare-metal Talos Kubernetes cluster for physical nodes. It generates the Talos machine secrets and configuration, applies the config to each control-plane and worker node, bootstraps the cluster, and exports the client and kubeconfig needed to manage the cluster.

It is intended for declarative installation of a Talos-based Kubernetes environment with Cilium bootstrap support and per-node network and disk configuration.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_talos"></a> [talos](#requirement\_talos) | >= 0.11.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_talos"></a> [talos](#provider\_talos) | >= 0.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [talos_cluster_kubeconfig.this](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/cluster_kubeconfig) | resource |
| [talos_machine_bootstrap.this](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/machine_bootstrap) | resource |
| [talos_machine_configuration_apply.this](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/machine_configuration_apply) | resource |
| [talos_machine_secrets.this](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/machine_secrets) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cilium"></a> [cilium](#input\_cilium) | Cilium bootstrap settings | ```object({ version = string values = string })``` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Bare-metal Talos cluster details | ```object({ name = string endpoint = string talos_version = string installer_image = string kubernetes_version = string control_plane_nodes = list(string) worker_nodes = list(string) })``` | n/a | yes |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | Bare-metal nodes which start in Talos maintenance mode | ```map(object({ ip = string machine_type = string hostname = string install_disk = string network_interface = string }))``` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_client_configuration"></a> [client\_configuration](#output\_client\_configuration) | Generated Talos client configuration |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | Generated kubeconfig for the existing Talos cluster |
| <a name="output_machine_config"></a> [machine\_config](#output\_machine\_config) | Generated machine configurations |
| <a name="output_machine_config_keys"></a> [machine\_config\_keys](#output\_machine\_config\_keys) | Stable names of the managed machine configurations |
<!-- END_TF_DOCS -->