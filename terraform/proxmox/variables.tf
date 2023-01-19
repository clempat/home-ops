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
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFV7+yMdRps8qQex9xlYcntTFEJa6q6H7vDhAXYLWjHa clement@tuxedo"
}
