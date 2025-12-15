resource "proxmox_virtual_environment_vm" "SRV-PROD-01" {
  name = "SRV-PROD-01"
  description = "VM for Docker containers"
  tags = ["linux","server","prod"]
  node_name = "LeMans"
  stop_on_destroy = true

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 10
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 99
    model = "virtio"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.10.253/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.253/24"
        gateway = "192.168.99.254"
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
    vm_id = 102
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_vm" "MAIL-PROD-01" {
  name = "MAIL-PROD-01"
  description = "VM for Mail server"
  tags = ["linux","server","prod"]
  node_name = "LeMans"
  stop_on_destroy = true

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 10
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 99
    model = "virtio"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.10.252/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.252/24"
        gateway = "192.168.99.254"
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
    vm_id = 102
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_vm" "MONITOR-PROD-01" {
  name = "MONITOR-PROD-01"
  description = "VM for Prometheus monitoring"
  tags = ["linux","server","prod"]
  node_name = "LeMans"
  stop_on_destroy = true

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 10
    model = "virtio"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 99
    model = "virtio"
  }

  initialization {
    datastore_id = "local"

    ip_config {
      ipv4 {
        address = "192.168.10.251/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.251/24"
        gateway = "192.168.99.254"
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
    vm_id = 102
    datastore_id = "local"
    full = true
    node_name = "LeMans"
  }
}

resource "proxmox_virtual_environment_pool" "PROD" {
  pool_id = "PROD"
}

resource "proxmox_virtual_environment_pool_membership" "SRV-PROD-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.SRV-PROD-01.id
}

resource "proxmox_virtual_environment_pool_membership" "MAIL-PROD-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.MAIL-PROD-01.id
}

resource "proxmox_virtual_environment_pool_membership" "MONITOR-PROD-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.MONITOR-PROD-01.id
}

