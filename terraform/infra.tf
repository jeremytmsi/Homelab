resource "proxmox_virtual_environment_vm" "Spa" {
  name = "Spa"
  description = "VM for Docker containers"
  tags = ["linux","server","prod"]
  node_name = "FIA"

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
      username = "jeremy"
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8qscFPE4POlT4WX0Ju1JmDDc0GhL5yp56z/+Tc7u/8 ansible_config",
        "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIC32RZaHUzt2hlELKu7qAb0PPKnnJFHyvDHMWnhjO9l3AAAABHNzaDo= me@jeremytomasi.fr"
      ]
    }
  }

  clone {
    vm_id = 104
    datastore_id = "local"
    full = true
    node_name = "FIA"
  }
}

resource "proxmox_virtual_environment_pool" "PROD" {
  pool_id = "PROD"
}

resource "proxmox_virtual_environment_pool_membership" "EVE-NG" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = 103
}

resource "proxmox_virtual_environment_pool_membership" "FW" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = 100
}

resource "proxmox_virtual_environment_pool_membership" "Spa" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.Spa.id
}
