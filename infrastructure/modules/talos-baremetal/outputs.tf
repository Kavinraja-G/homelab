output "client_configuration" {
  value       = data.talos_client_configuration.this
  description = "Generated Talos client configuration"
  sensitive   = true
}

output "kube_config" {
  value       = talos_cluster_kubeconfig.this
  description = "Generated kubeconfig for the existing Talos cluster"
  sensitive   = true
}

output "machine_config" {
  value       = data.talos_machine_configuration.this
  description = "Generated machine configurations"
  sensitive   = true
}

output "machine_config_keys" {
  value       = nonsensitive(keys(data.talos_machine_configuration.this))
  description = "Stable names of the managed machine configurations"
}
