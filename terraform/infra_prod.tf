resource "proxmox_virtual_environment_vm" "SRV-PROD-01" {
  name = "SRV-PROD-01"
  description = "VM for Docker containers"
  tags = ["linux","server","prod"]
  node_name = "LeMans"

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 10
    model = "e1000"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 99
    model = "e1000"
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }

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
      username = "jeremy"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIC32RZaHUzt2hlELKu7qAb0PPKnnJFHyvDHMWnhjO9l3AAAABHNzaDo= me@jeremytomasi.fr"
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

resource "proxmox_virtual_environment_vm" "MAIL-PROD-01" {
  name = "MAIL-PROD-01"
  description = "VM for Mail server"
  tags = ["linux","server","prod"]
  node_name = "LeMans"

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 10
    model = "e1000"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 99
    model = "e1000"
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }

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
      username = "jeremy"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIC32RZaHUzt2hlELKu7qAb0PPKnnJFHyvDHMWnhjO9l3AAAABHNzaDo= me@jeremytomasi.fr"
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

resource "proxmox_virtual_environment_vm" "MONITOR-PROD-01" {
  name = "MONITOR-PROD-01"
  description = "VM for Prometheus monitoring"
  tags = ["linux","server","prod"]
  node_name = "LeMans"

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 10
    model = "e1000"
  }

  network_device {
    bridge = "vmbr2"
    vlan_id = 99
    model = "e1000"
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }

    ip_config {
      ipv4 {
        address = "192.168.10.250/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.250/24"
        gateway = "192.168.99.254"
      }
    }

    user_account {
      username = "jeremy"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIC32RZaHUzt2hlELKu7qAb0PPKnnJFHyvDHMWnhjO9l3AAAABHNzaDo= me@jeremytomasi.fr"
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

resource "proxmox_virtual_environment_pool" "PROD" {
  pool_id = "PROD"
}

resource "proxmox_virtual_environment_pool_membership" "FW-PROD-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = 100
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
