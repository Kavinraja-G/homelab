# Kubernetes GitOps Driver

This directory contains all Kubernetes manifests, Helm charts, and Kustomize overlays for deploying and managing the homelab cluster using GitOps.

## Structure

- [apps/](./apps/) - Cluster-hosted applications. LittleLink is currently enabled; Glance is disabled here.
- [charts/](./charts/) - Custom Helm charts.
- [clusters/](./clusters/) - Cluster-specific Flux entry points.
- [system/](./system/) - Platform services including Cert-Manager, Cilium, External Secrets, Flux notification configuration, Grafana, Kubeseal, OpenEBS, Pangolin Newt, Prometheus, and Reloader.

## Usage

- All resources are managed declaratively and synchronized to the cluster via [FluxCD](https://fluxcd.io/).
- To deploy or update components, edit the relevant manifests and commit changes to Git; Flux will reconcile the cluster state automatically.

See each subdirectory for more details and configuration options.