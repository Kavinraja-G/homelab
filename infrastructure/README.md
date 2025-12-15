# HomeLab Infrastructure

All my homelab infrastructure are deployed via [OpenTofu](https://opentofu.org). Agree, it's overkill. But why not? if it's fun and put your brain to work. :)

### Overview

Deploys the following components:
1. **Proxmox VMs** in the host nodes as defined.
2. [Talos](https://docs.siderolabs.com/talos) based K8s cluster on the VMs.
3. Bootstraps K8s cluster with FluxCD components and intializes the [monorepo](../kubernetes/clusters/homelab/).