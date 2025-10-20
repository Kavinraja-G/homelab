# AdGuardHome

### Sealing admin credentials

```bash
# Create generic credentials for admin user locally
kubectl create secret generic adguard-credentials
    --namespace adguard \
    --from-literal=username=admin \
    --from-literal=password=<bcrypted password> \
    --dry-run=client -o yaml > adguard-secret.yaml

# kubeseal and store in git
kubeseal --format yaml --controller-namespace kubeseal --controller-name kubeseal-sealed-secrets < adguard-secret.yaml > credentials.yaml

# Remove generic secret
rm adguard-secret.yaml
```