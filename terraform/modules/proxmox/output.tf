output "servers" {
  description = "IPV4 of all k8s servers"
  value       = zipmap(resource.proxmox_vm_qemu.k8s_server[*].name, resource.proxmox_vm_qemu.k8s_server[*].default_ipv4_address)
  depends_on = [
    proxmox_vm_qemu.k8s_server
  ]
}

