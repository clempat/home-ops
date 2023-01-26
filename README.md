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

1. `task workstations:prepare` - Install necessary dependancies on workstation
2. `task terraform:networking` - Setup unifi Homelab networking
3. `task terraform:create` - Provision the VMs for the cluster
4. `task cluster:Install` - Install needs for cluster and k3s
5. `task cluster:bootstrap` - Launch argoCD and apps
6. `export KUBECONFIG=$(PWD)/kubeconfig`

You can know check the nodes with `kubectl get nodes`

## Nuke

```bash
task terraform:nuke
```
