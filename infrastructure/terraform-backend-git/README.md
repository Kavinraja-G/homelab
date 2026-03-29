# Backend: Git State + SOPS Age

Use this folder to run [plumber-cd/terraform-backend-git](https://github.com/plumber-cd/terraform-backend-git) as HTTP backend for OpenTofu/Terraform.

## Requirements

- Docker
- OpenTofu or Terraform
- `brew install age`
- SSH access to state repository

## Configure Environment

Set these values in `.env`:

```dotenv
TF_BACKEND_GIT_GIT_REPOSITORY=git@github.com:Kavinraja-G/homelab-tofu-state.git
TF_BACKEND_GIT_GIT_REF=main
TF_BACKEND_GIT_GIT_STATE=homelab/main-infra-state.json
TF_BACKEND_HTTP_ENCRYPTION_PROVIDER=sops
HOST_SOPS_AGE_KEYS_FILE=/Users/kavin/.config/sops/age/keys.txt
TF_BACKEND_HTTP_SOPS_AGE_RECIPIENTS=<age public key>
```

## Start Backend Service

```bash
docker compose up -d
docker compose logs -f
```

## Initialize Tofu Backend

From `infrastructure/`:

```bash
tofu init -reconfigure
```