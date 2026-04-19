resource "proxmox_virtual_environment_vm" "docker-prod-01" {
  name = "docker.prod.jeremytomasi.fr"
  description = "VM for hosting Docker services"
  tags = ["linux","prod"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 101

  agent {
    enabled = true
  }

  cpu {
    cores = 16
    type = "host"
  }

  memory {
    dedicated = 16384
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 10
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 99
  }

  disk {
    datastore_id = "local"
    interface = "scsi1"
    size = 1000
    file_format = "raw"
    discard = "on"
    ssd = true
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }

    ip_config {
      ipv4 {
        address = "192.168.10.1/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.1/24"
        gateway = "192.168.99.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxo2h1vfU1YHjZaS9DQ+Liob0I5zCI3E2bj0NHs0uWL ansible_config_prod"]
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}


resource "proxmox_virtual_environment_vm" "mail-prod-01" {
  name = "mail.prod.jeremytomasi.fr"
  description = "VM for mails"
  tags = ["linux","prod"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 102

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 10
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 99
  }

  disk {
    interface = "scsi1"
    size = 500
    file_format = "raw"
    datastore_id = "local"
    ssd = true
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.10.2/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.2/24"
        gateway = "192.168.99.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxo2h1vfU1YHjZaS9DQ+Liob0I5zCI3E2bj0NHs0uWL ansible_config_prod"]
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "storage-prod-01" {
  name = "storage.prod.jeremytomasi.fr"
  description = "VM for storage"
  tags = ["linux","prod"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 103

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 10
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 99
  }

  disk {
    interface = "scsi1"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
    ssd = true
  }

  disk {
    interface = "scsi2"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
    ssd = true
  }

  disk {
    interface = "scsi3"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
    ssd = true
  }

  disk {
    interface = "scsi4"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
    ssd = true
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.10.3/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.3/24"
        gateway = "192.168.99.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxo2h1vfU1YHjZaS9DQ+Liob0I5zCI3E2bj0NHs0uWL ansible_config_prod"]
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "wazuh-prod-01" {
  name = "wazuh.prod.jeremytomasi.fr"
  description = "VM for Wazuh"
  tags = ["linux","prod"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 104

  cpu {
    sockets = 1
    cores = 8
    type = "host"
  }

  memory {
    dedicated = 16384
  }

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 10
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 99
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.10.4/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.4/24"
        gateway = "192.168.99.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKxo2h1vfU1YHjZaS9DQ+Liob0I5zCI3E2bj0NHs0uWL ansible_config_prod"]
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}
