# Proxmox CSI
Deploys [Proxmox CSI PLugin](https://github.com/sergelogvinov/proxmox-csi-plugin) and default storage classes.

### Requirements
- `homelab-k8s-csi@pve` PVE User and Token manually created. (looks for auto-sync once we have Secrets Management in place. Bitwarden?)
- Kubeseal the secret configs for CSI

### Sealing Secret
```bash
# ./secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: proxmox-csi-plugin
  namespace: csi-proxmox
stringData:
  config.yaml: |
    clusters:
    - url: "https://<PVE_CLUSTER_NODE>:8006/api2/json"
      insecure: true
      token_id: "homelab-k8s-csi@pve!csi"
      token_secret: "<TOKEN>"
      region: homelab

# Kubeseal the secret
kubeseal --format yaml --controller-namespace kubeseal --controller-name kubeseal-sealed-secrets < secrets.yaml > ./secret.yaml
```