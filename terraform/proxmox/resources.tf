resource "proxmox_vm_qemu" "k8s_server" {
  count       = 1
  name        = "${var.target_node}-master-1${count.index + 1}"
  target_node = var.target_node

  clone = var.cloudinit_template

  agent    = 1
  os_type  = "cloud-init"
  cores    = 4
  cpu      = "host"
  memory   = 16384
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  onboot   = true

  disk {
    size     = "100G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 1
    backup   = false
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0 = "ip=192.168.40.11${count.index + 1}/24,gw=192.168.40.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "k8s_agent" {
  count       = 1
  name        = "${var.target_node}-node-1${count.index + 1}"
  target_node = var.target_node

  clone = var.cloudinit_template

  agent    = 1
  os_type  = "cloud-init"
  cores    = 2
  cpu      = "host"
  memory   = 16384
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    size     = "100G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 1
    backup   = false
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0 = "ip=192.168.40.12${count.index + 1}/24,gw=192.168.40.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
