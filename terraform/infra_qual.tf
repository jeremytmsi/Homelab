resource "proxmox_virtual_environment_vm" "SRV-QUAL-01" {
  name = "SRV-QUAL-01"
  description = "VM for Docker containers"
  tags = ["linux","server","qual"]
  node_name = "LeMans"
  stop_on_destroy = true
  vm_id = 104

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 20
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 98
    model = "virtio"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.20.253/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.253/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = "ansible"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
      ]
    }
  }

  clone {
    vm_id = 101
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_vm" "MAIL-QUAL-01" {
  name = "MAIL-QUAL-01"
  description = "VM for Mail server"
  tags = ["linux","server","qual"]
  node_name = "LeMans"
  stop_on_destroy = true
  vm_id = 105

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 20
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 98
    model = "virtio"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.20.252/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.252/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = "ansible"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
      ]
    }
  }

  clone {
    vm_id = 101
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_vm" "MONITOR-QUAL-01" {
  name = "MONITOR-QUAL-01"
  description = "VM for Prometheus monitoring"
  tags = ["linux","server","qual"]
  node_name = "LeMans"
  stop_on_destroy = true
  vm_id = 106

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 20
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 98
    model = "virtio"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.20.251/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.251/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = "ansible"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
      ]
    }
  }

  clone {
    vm_id = 101
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_vm" "VPS-QUAL-01" {
  name = "VPS-QUAL-01"
  description = "VPS Qual"
  tags = ["linux","server","qual"]
  node_name = "LeMans"
  stop_on_destroy = true
  vm_id = 107

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 20
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 98
    model = "virtio"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.20.250/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.250/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = "ansible"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
      ]
    }
  }

  clone {
    vm_id = 101
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_vm" "STORAGE-QUAL-01" {
  name = "STORAGE-QUAL-01"
  description = "Storage Qual"
  tags = ["linux","server","qual"]
  node_name = "LeMans"
  stop_on_destroy = true
  vm_id = 108

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 20
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 98
    model = "virtio"
  }

  disk {
    interface = "scsi1"
    size = 4000
    datastore_id = "local"
  }

  disk {
    interface = "scsi2"
    size = 4000
    datastore_id = "local"
  }

  disk {
    interface = "scsi3"
    size = 4000
    datastore_id = "local"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.20.249/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.249/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = "ansible"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
      ]
    }
  }

  clone {
    vm_id = 101
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_pool" "QUAL" {
  pool_id = "QUAL"
}

resource "proxmox_virtual_environment_pool_membership" "SRV-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.SRV-QUAL-01.id
}

resource "proxmox_virtual_environment_pool_membership" "MAIL-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.MAIL-QUAL-01.id
}

resource "proxmox_virtual_environment_pool_membership" "MONITOR-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.MONITOR-QUAL-01.id
}

resource "proxmox_virtual_environment_pool_membership" "VPS-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.VPS-QUAL-01.id
}

resource "proxmox_virtual_environment_pool_membership" "STORAGE-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.STORAGE-QUAL-01.id
}
