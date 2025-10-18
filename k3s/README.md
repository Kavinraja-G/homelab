# K3s cluster setup
K3s installation in my homelab servers using the default [ansible playbook](https://github.com/k3s-io/k3s-ansible).

### Setup
- Generate passwordless access using `ssh` from control machine to the servers
    ```sh
    ssh-keygen -t ed25519 -C "kavin@homelab"
    ssh-copy-id -i ~/.ssh/id_ed25519.pub kavin@192.168.0.111
    ssh-copy-id -i ~/.ssh/id_ed25519.pub kavin@192.168.0.110
    ```
- Setting default SSH passphrase to avoid during playbook execution
    ```sh
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```
- Run ansbible using the inventory file
    ```
    ansible-playbook k3s.orchestration.site -i inventory.yml --ask-become-pass
    ```