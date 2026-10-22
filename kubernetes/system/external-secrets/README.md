# External Secrets Bootstrap

Create or rotate the Bitwarden Secrets Manager access token without writing the plaintext token to disk or Git.

The Sealed Secrets controller runs in the `kubeseal` namespace with the default name `kubeseal-sealed-secrets`.

```bash
read -s BWS_ACCESS_TOKEN
printf '\n'

kubectl create secret generic bws-access-token \
  --namespace external-secrets \
  --from-literal=ACCESS_TOKEN="$BWS_ACCESS_TOKEN" \
  --dry-run=client \
  --output yaml |
kubeseal \
  --format yaml \
  --controller-name kubeseal-sealed-secrets \
  --controller-namespace kubeseal \
  > kubernetes/system/external-secrets/secret.yaml

unset BWS_ACCESS_TOKEN
```

Validate the generated manifest before committing:

```bash
kubectl apply \
  --dry-run=client \
  --validate=true \
  -f kubernetes/system/external-secrets/secret.yaml
```
