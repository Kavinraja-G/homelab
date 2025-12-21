terraform {
  backend "http" {
    address = "http://localhost:6061/?type=git&repository=git@github.com:Kavinraja-G/homelab-tofu-state&ref=main&state=my/homelab/main-infra-state.json"
    lock_address = "http://localhost:6061/?type=git&repository=git@github.com:Kavinraja-G/homelab-tofu-state&ref=main&state=my/homelab/main-infra-state.json"
    unlock_address = "http://localhost:6061/?type=git&repository=git@github.com:Kavinraja-G/homelab-tofu-state&ref=main&state=my/homelab/main-infra-state.json"
  }
}