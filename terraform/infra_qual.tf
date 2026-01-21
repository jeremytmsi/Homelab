resource "proxmox_virtual_environment_vm" "DOCKER-QUAL-01" {
  name = "docker.qual.jeremytomasi.fr"
  description = "VM for hosting Docker services"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 110

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
    model = "e1000"
    bridge = "vmbr2"
    vlan_id = 20
  }

  network_device {
    model = "e1000"
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

resource "proxmox_virtual_environment_vm" "MAIL-QUAL-01" {
  name = "mail.qual.jeremytomasi.fr"
  description = "VM for hosting mail server"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 111

  agent {
    enabled = true
  }

  cpu {
    cores = 4
    type = "host"
  }

  network_device {
    model = "e1000"
    bridge = "vmbr2"
    vlan_id = 20
  }

  network_device {
    model = "e1000"
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

resource "proxmox_virtual_environment_vm" "MONITORING-QUAL-01" {
  name = "monitoring.qual.jeremytomasi.fr"
  description = "VM for monitoring"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 112

  agent {
    enabled = true
  }

  network_device {
    model = "e1000"
    bridge = "vmbr2"
    vlan_id = 20
  }

  network_device {
    model = "e1000"
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
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 190
    full = true
  }
}
