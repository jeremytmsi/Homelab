resource "proxmox_virtual_environment_vm" "DOCKER-QUAL-01" {
  name = "docker.qual.jeremytomasi.fr"
  description = "VM for hosting Docker services"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 112

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
    vlan_id = 20
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 98
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }

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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "NEXTCLOUD-QUAL-01" {
  name = "nextcloud.qual.jeremytomasi.fr"
  description = "VM for hosting Nextcloud"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 113

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 20
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 98
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }

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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}



resource "proxmox_virtual_environment_vm" "NEXTCLOUDDB-QUAL-01" {
  name = "nextclouddb.qual.jeremytomasi.fr"
  description = "VM for hosting Nextcloud database"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 115

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 20
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 98
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }


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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "MONITORING-QUAL-01" {
  name = "monitoring.qual.jeremytomasi.fr"
  description = "VM for monitoring"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 116

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 20
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 98
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }


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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "STORAGE-QUAL-01" {
  name = "storage.qual.jeremytomasi.fr"
  description = "VM for simulating storage"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 117

  agent {
    enabled = true
  }

  disk {
    datastore_id = "local"
    interface = "scsi1"
    size = 1000
    file_format = "raw"
  }

  disk {
    datastore_id = "local"
    interface = "scsi2"
    size = 1000
    file_format = "raw"
  }

  disk {
    datastore_id = "local"
    interface = "scsi3"
    size = 1000
    file_format = "raw"
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 20
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 98
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.20.248/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.248/24"
        gateway = "192.168.98.254"
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
