# My Homelab

## Tools

### Base

- 1Password
- Proxmox
- Terraform
- Ansible
- K3S
- ArgoCD

# Usage

All my secrets are in a 1Password Vault called "Homelab". First, I need to make sure the workstation has 1Password and 1Password cli working. More details about my workstation there: [nix-config](https://github.com/clempat/nix-config)

I have a Proxmox server running, an API key with permission to PVEAdmin on '/' and Administrator on drives.

I have as well on the workstation go-task, terraform, ansible and more installed.

1. `task cluster:create` - Provide nodes on Proxmox
2. `task cluster:prepare` - Install needs for cluster and k3s
