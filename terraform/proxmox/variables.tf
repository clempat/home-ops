# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "proxmox_url" {
  default = "https://192.168.30.8:8006/api2/json"
}

variable "cloudinit_template" {
  default = "ubuntu-2004-cloudinit-template"
}

variable "target_node" {
  default = "hp"
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPwMKbHTiffsltsF+SN44pDjK3YbyuL6Nst5aY/k3NFU clement@1password"
}
