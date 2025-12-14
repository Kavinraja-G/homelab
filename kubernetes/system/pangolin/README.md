# Pangolin Newt Agents
Deploying `newt` agents in homelab

## Sealing Secrets
```bash
# Create .env file with secrets
NEWT_ID=**************
PANGOLIN_ENDPOINT=https://pangolin.example.com
NEWT_SECRET=**************

# Create Envs for newt
❯ kubectl create secret generic newt-cred -n pangolin --from-env-file=newt-cred.env --dry-run=client -o yaml > newt-secret.yaml

# Seal using kubeseal
❯ kubeseal --format yaml --controller-namespace kubeseal --controller-name kubeseal-sealed-secrets < newt-secret.yaml > ./credentials.yaml
```