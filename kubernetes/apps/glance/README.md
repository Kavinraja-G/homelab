# Glance Dashboard

## Sealing Secrets
```
kubectl create secret generic glance-secrets
    --namespace glance \
    --from-literal=ADGUARD_HOME_USERNAME=admin \
    --from-literal=ADGUARD_HOME_PASSWORD=adguardhome@HomeLab34 \
    --from-literal=RENGOKU_GLANCE_AGENT_TOKEN=i359fozGxaiqzzM76Dqx7QLsi8LABadtmKaE \
    --dry-run=client -o yaml > glance-secrets.yaml

# kubeseal and store in git
kubeseal --format yaml --controller-namespace kubeseal --controller-name kubeseal-sealed-secrets < glance-secrets.yaml > secrets.yaml

# Remove generic secret
rm glance-secrets.yaml
```