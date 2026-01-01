resource "proxmox_virtual_environment_vm" "SRV-QUAL-01" {
  name = "srv-01.qual.jeremytomasi.fr"
  description = "VM for Docker containers"
  tags = ["linux","server","qual"]
  node_name = "LeMans"
  stop_on_destroy = true
  vm_id = 110

  agent {
    enabled = true
  }

  cpu {
    sockets = 1
    cores = 16
  }

  memory {
    dedicated = 16384
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 20
    model = "e1000"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 98
    model = "e1000"
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

resource "proxmox_virtual_environment_vm" "STORAGE-QUAL-01" {
  name = "storage-01.qual.jeremytomasi.fr"
  description = "VM that simulates a storage server"
  tags = ["linux","server","qual"]
  node_name = "LeMans"
  stop_on_destroy = true
  vm_id = 112

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 20
    model = "e1000"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 98
    model = "e1000"
  }

  disk {
    interface = "scsi1"
    file_format = "raw"
    size = 500
    datastore_id = "local"
  }

  disk {
    interface = "scsi2"
    file_format = "raw"
    size = 500
    datastore_id = "local"
  }

  disk {
    interface = "scsi3"
    file_format = "raw"
    size = 500
    datastore_id = "local"
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

resource "proxmox_virtual_environment_pool" "QUAL" {
  pool_id = "QUAL"
}

resource "proxmox_virtual_environment_pool_membership" "SRV-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.SRV-QUAL-01.id
}

resource "proxmox_virtual_environment_pool_membership" "STORAGE-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.STORAGE-QUAL-01.id
}
