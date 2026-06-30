resource "proxmox_virtual_environment_vm" "vm-docker-prod" {
  name = "docker.jeremytomasi.fr"
  description = "VM for hosting Docker services"
  tags = ["linux"]
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

  }

  clone {
    vm_id = 301
    full = true
  }
}


resource "proxmox_virtual_environment_vm" "vm-mail-prod" {
  name = "mail.jeremytomasi.fr"
  description = "VM for mails"
  tags = ["linux"]
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

  }

  clone {
    vm_id = 301
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "vm-storage-prod" {
  name = "storage.jeremytomasi.fr"
  description = "VM for storage"
  tags = ["linux"]
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

  }

  clone {
    vm_id = 301
    full = true
  }
}

resource "proxmox_virtual_environment_vm" "vm-unifi-prod" {
  name = "unifi.jeremytomasi.fr"
  description = "VM for Unifi OS"
  tags = ["linux"]
  node_name = var.node_name
  stop_on_destroy = true
  vm_id = 105

  agent {
    enabled = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr2"
    vlan_id = 10
  }

  initialization {
    datastore_id = "local"

    dns {
      domain = "prod.jeremytomasi.fr"
      servers = ["192.168.10.254"]
    }


    ip_config {
      ipv4 {
        address = "192.168.10.5/24"
        gateway = "192.168.10.254"
      }
    }

  }

  clone {
    vm_id = 301
    full = true
  }
}


