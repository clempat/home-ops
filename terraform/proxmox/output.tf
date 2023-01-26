locals {
  servers = zipmap(resource.proxmox_vm_qemu.k8s_server[*].name, resource.proxmox_vm_qemu.k8s_server[*].default_ipv4_address)
  agents  = zipmap(resource.proxmox_vm_qemu.k8s_agent[*].name, resource.proxmox_vm_qemu.k8s_agent[*].default_ipv4_address)
  inventory = {
    kubernetes : {
      children : {
        master : {
          vars : {
            ansible_user : "ubuntu"
            ansible_ssh_common_args : "-o StrictHostKeyChecking=no"
          }
          hosts : {
            for name in keys(local.servers) : name => { "ansible_host" : local.servers[name] }
          }
        }
        agent : {
          vars : {
            ansible_user : "ubuntu"
            ansible_ssh_common_args : "-o StrictHostKeyChecking=no"
          }
          hosts : {
            for name in keys(local.agents) : name => { "ansible_host" : local.agents[name] }
          }
        }
      }
    }
  }
}

resource "local_file" "ansible_hosts_yaml" {
  content  = <<-DOC
    ---
    # Generated by Terraform mgmt configuration.
    ${yamlencode(local.inventory)}
  DOC
  filename = "../../ansible/inventory/hosts.yml"

}


