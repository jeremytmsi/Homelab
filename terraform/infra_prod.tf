resource "proxmox_virtual_environment_vm" "docker-prod-01" {
  name = "docker.prod.jeremytomasi.fr"
  description = "VM for hosting Docker services"
  tags = ["linux","server","prod"]
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
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }

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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "monitoring-prod-01" {
  name = "monitoring.prod.jeremytomasi.fr"
  description = "VM for monitoring"
  tags = ["linux","server","prod"]
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

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "storage-prod-01" {
  name = "storage.prod.jeremytomasi.fr"
  description = "VM for storage"
  tags = ["linux","server","prod"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 104

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
  }

  disk {
    interface = "scsi2"
    size = 500
    datastore_id = "local"
    file_format = "raw"
  }

  disk {
    interface = "scsi3"
    size = 500
    datastore_id = "local"
    file_format = "raw"
  }

  disk {
    interface = "scsi4"
    size = 500
    datastore_id = "local"
    file_format = "raw"
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "wazuh-prod-01" {
  name = "wazuh.prod.jeremytomasi.fr"
  description = "VM for Wazuh"
  tags = ["linux","server","prod"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 105

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
        address = "192.168.10.249/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.249/24"
        gateway = "192.168.99.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "guacamole-prod-01" {
  name = "guacamole.prod.jeremytomasi.fr"
  description = "VM for Guacamole"
  tags = ["linux","server","prod"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 106

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
        address = "192.168.10.248/24"
        gateway = "192.168.10.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.99.248/24"
        gateway = "192.168.99.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}
