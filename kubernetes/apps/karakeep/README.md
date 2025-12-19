# Karakeep

[Karakeep](https://github.com/karakeep-app) - Personal inventory for ***bookmarks*** across all my devices.

### Sealing Secrets
```bash
# .secrets
NEXTAUTH_SECRET=**********************************
MEILI_MASTER_KEY=**********************************
NEXT_PUBLIC_SECRET=**********************************
NEXTAUTH_URL=https://bookmarks.example.com

# Create secrets.yaml based on the env
kubectl create secret generic karakeep-secrets -n karakeep --from-env-file=.secrets --dry-run=client -o yaml > secrets.yaml

# Kubeseal the secret itself
kubeseal --format yaml --controller-namespace kubeseal --controller-name kubeseal-sealed-secrets < secrets.yaml > ./secret.yaml
```