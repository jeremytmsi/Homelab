resource "proxmox_virtual_environment_vm" "vm-bunkerweb-prod" {
  name = "bunkerweb.jeremytomasi.fr"
  description = "VM for Bunkerweb"
  tags = ["linux"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 250

  agent {
    enabled = true
  }

  memory {
    dedicated = 8192
  }

  network_device {
    model = "virtio"
    bridge = "vmbr0"
  }

  initialization {
    datastore_id = "VMs"

    dns {
      servers = ["192.168.1.254"]
    }

    ip_config {
      ipv4 {
        address = "192.168.1.250/24"
        gateway = "192.168.1.254"
      }
    }
  }

  serial_device {
    device = "socket"
  }

  clone {
    vm_id = 301
    full = true
  }
}



resource "proxmox_virtual_environment_vm" "vm-docker-prod" {
  name = "docker.jeremytomasi.fr"
  description = "VM for hosting Docker services"
  tags = ["linux"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 249

  agent {
    enabled = true
  }

  cpu {
    cores = 8
    type = "host"
  }

  memory {
    dedicated = 8192
  }

  network_device {
    model = "virtio"
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "VMs"
    interface = "scsi1"
    size = 200
    file_format = "raw"
    discard = "on"
    ssd = true
    backup = false
  }

  initialization {
    datastore_id = "VMs"

    dns {
      servers = ["192.168.1.254"]
    }

    ip_config {
      ipv4 {
        address = "192.168.1.249/24"
        gateway = "192.168.1.254"
      }
    }
  }

  serial_device {
    device = "socket"
  }

  clone {
    vm_id = 301
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "vm-wazuh-prod" {
  name = "wazuh.jeremytomasi.fr"
  description = "VM for Wazuh"
  tags = ["linux"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 248

  cpu {
    sockets = 1
    cores = 8
    type = "host"
  }

  memory {
    dedicated = 8192
  }

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr0"
  }

  initialization {
    datastore_id = "VMs"

    dns {
      servers = ["192.168.1.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.1.248/24"
        gateway = "192.168.1.254"
      }
    }

  }

  serial_device {
    device = "socket"
  }

  clone {
    vm_id = 301
    full = true
  }
}
