packer {
  required_plugins {
    name = {
      version = "1.2.2"
      source = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "debian-13" {
  proxmox_url = var.proxmox_url
  node = "LeMans"
  username = var.proxmox_user
  token = var.proxmox_token
  insecure_skip_tls_verify = true

  template_name = "DEBIAN-13.2-TPL"
  vm_name = "DEBIAN-13.2-TPL"
  template_description = "Debian 13 template"
  tags = "template;linux;server"
  pool = "TEMPLATE"
  os = "l26"
  machine = "q35"
  vm_id = 190

  boot_iso {
    type = "scsi"
    iso_file = "local:iso/debian-13.2.0-amd64-DVD-1.iso"
    unmount = true
    iso_checksum = "none"
  }

  boot_command = ["<esc><wait>auto console-keymaps-at/keymap=fr console-setup/ask_detect=false debconf/frontend=noninteractive fb=false url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-preseed.cfg<enter>"]
  boot_wait = "10s"
  http_directory = "packer/http"
  http_interface = "utun2"

  disks {
    type = "scsi"
    storage_pool = "local"
    disk_size = "60G"
    format = "raw"
  }

  network_adapters {
    bridge = "vmbr2"
    vlan_tag = 10
    model = "virtio"
  }

  bios = "seabios"
  qemu_agent = true
  scsi_controller = "virtio-scsi-pci"
  cpu_type = "host"
  sockets = 1
  cores = 4
  memory = 4096

  communicator = "ssh"
  ssh_handshake_attempts = 5
  ssh_pty = true
  ssh_timeout = "20m"
  ssh_username = var.ssh_user
  ssh_password = var.ssh_password

  cloud_init = true
  cloud_init_storage_pool = "local"
}

build {
  sources = ["proxmox-iso.debian-13"]
}

variable "proxmox_url" {
  type = string
}

variable "proxmox_user" {
  type = string
}

variable "proxmox_token" {
  type = string
  sensitive = true
}

variable "ssh_user" {
  type = string
}

variable "ssh_password" {
  type = string
  sensitive = true
}
