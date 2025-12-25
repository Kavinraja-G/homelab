# Kubernetes GitOps Driver

This directory contains all Kubernetes manifests, Helm charts, and Kustomize overlays for deploying and managing the homelab cluster using GitOps.

## Structure

- [apps/](./apps/) - User-facing applications and workloads (e.g., AdGuardHome, Glance, Karakeep, LittleLink)
- [charts/](./charts/) - Custom ad-hoc Helm charts.
- [clusters/](./clusters/) - Cluster-specific overlays and Flux sync manifests.
- [system/](./system/) - Core platform services and infrastructure (e.g., Cert-Manager, Cilium, External Secrets, Kubeseal, Metrics Server, Pangolin, Proxmox CSI, Reloader)

## Usage

- All resources are managed declaratively and synchronized to the cluster via [FluxCD](https://fluxcd.io/).
- To deploy or update components, edit the relevant manifests and commit changes to Git; Flux will reconcile the cluster state automatically.

See each subdirectory for more details and configuration options.