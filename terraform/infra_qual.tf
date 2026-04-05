resource "proxmox_virtual_environment_vm" "docker-qual-01" {
  name = "docker.qual.jeremytomasi.fr"
  description = "VM for hosting Docker services"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 201

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

  disk {
    datastore_id = "local"
    interface = "scsi1"
    size = 1000
    file_format = "raw"
    discard = "on"
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }

    ip_config {
      ipv4 {
        address = "192.168.20.1/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.1/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}


resource "proxmox_virtual_environment_vm" "mail-qual-01" {
  name = "mail.qual.jeremytomasi.fr"
  description = "VM for mails"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 202

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

  disk {
    interface = "scsi1"
    size = 500
    file_format = "raw"
    datastore_id = "local"
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.20.2/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.2/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "storage-qual-01" {
  name = "storage.qual.jeremytomasi.fr"
  description = "VM for storage"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 203

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

  disk {
    interface = "scsi1"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
  }

  disk {
    interface = "scsi2"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
  }

  disk {
    interface = "scsi3"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
  }

  disk {
    interface = "scsi4"
    size = 500
    datastore_id = "local"
    file_format = "raw"
    discard = "on"
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "qual.jeremytomasi.fr"
      servers = ["192.168.20.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.20.3/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.3/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "wazuh-qual-01" {
  name = "wazuh.qual.jeremytomasi.fr"
  description = "VM for Wazuh"
  tags = ["linux","server","qual"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 204

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
        address = "192.168.20.4/24"
        gateway = "192.168.20.254"
      }
    }

    ip_config {
      ipv4 {
        address = "192.168.98.4/24"
        gateway = "192.168.98.254"
      }
    }

    user_account {
      username = var.vm_ssh_user
      keys = var.vm_ssh_keys
    }
  }

  clone {
    vm_id = 301
    full = true
  }
}

