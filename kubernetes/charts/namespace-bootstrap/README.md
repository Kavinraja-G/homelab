# namespace-bootstrap Helm chart

This minimal Helm chart creates a Kubernetes Namespace resource. It's intended to be used as a simple, generic chart that Flux can install from this repository to bootstrap namespaces.

### Example values

values.yaml (multiple namespaces)
```yaml
namespaces:
  - name: monitoring
    labels:
      environment: prod
  - name: web-app-a
    annotations:
      owner: team-a
```