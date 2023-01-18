resource "proxmox_vm_qemu" "k8s_server" {
  count       = 2
  name        = "${var.target_node}-master-${count.index + 1}"
  target_node = var.target_node

  clone = var.cloudinit_template

  agent    = 1
  os_type  = "cloud-init"
  cores    = 4
  sockets  = 1
  cpu      = "host"
  memory   = 8192
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  onboot   = true

  disk {
    slot     = 0
    size     = "25G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 1
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0 = "ip=192.168.30.6${count.index + 1}/24,gw=192.168.30.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

