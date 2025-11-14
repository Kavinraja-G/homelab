## Deploying Bezel

### Sealing Secrets
Use `kubectl` to create the `creds.env` and then seal the actual secret file.

```bash
# cred.env sample:
EMAIL=homelab-admin@imkavin.dev
PASSWORD=********************
KEY=ssh-ed25519 ********************
TOKEN=********************

# Step 1: Create the secret from file
kubectl create secret generic bezel-creds -n monitoring --from-env-file=cred.env --dry-run=client -o yaml > creds.yaml

# Step 2: Kubeseal the actual secret
kubeseal --format yaml --controller-namespace kubeseal --controller-name kubeseal-sealed-secrets -n monitoring < creds.yaml > ./secrets.yaml
```