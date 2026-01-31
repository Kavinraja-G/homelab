output "client_configuration" {
  value       = data.talos_client_configuration.this
  description = "Talos client configuration details"
  sensitive   = true
}

output "kube_config" {
  value       = talos_cluster_kubeconfig.this
  description = "Generated Kubeconfig for the Talos cluster"
  sensitive   = true
}

output "machine_config" {
  value       = data.talos_machine_configuration.this
  description = "Generated Machine configs for the Talos"
}
