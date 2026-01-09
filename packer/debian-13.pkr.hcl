packer {
  required_plugins {
    name = {
      version = ">= 1.2.2"
      source = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "debian13" {
  proxmox_url = "http://10.0.0.1:8006/api2/json"
  node = "Suzuka"
  username = "packer@pve!packer"
  token = var.proxmox_token
  insecure_skip_tls_verify = true

  template_name = "DEBIAN-13.2-TPL"
  vm_name = "DEBIAN-13.2-TPL"
  template_description = "Debian 13.2 VM, généré le ${timestamp()}"
  tags = "template;linux"
  vm_id = 190
  pool = "TEMPLATE"
  os = "l26"
  machine = "q35"

  boot_iso {
    type = "scsi"
    iso_file = "local:iso/debian-13.2.0-amd64-netinst.iso"
    unmount = true
    iso_checksum = "891d7936a2e21df1d752e5d4c877bb7ca2759c902b0bfbf5527098464623bedaa17260e8bd4acf1331580ae56a6a87a08cc2f497102daa991d5e4e4018fee82b"
  }
  boot_command = ["<esc><wait>auto console-keymaps-at/keymap=fr console-setup/ask_detect=false debconf/frontend=noninteractive fb=false url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-preseed.cfg<enter>"]
  boot_wait = "10s"
  http_directory = "packer/http"
  http_interface = "utun0"

  disks {
    type = "scsi"
    storage_pool = "local"
    disk_size = "60G"
    format = "raw"
  }

  network_adapters {
    bridge = "vmbr2"
    model = "virtio"
    vlan_tag = "10"
  }

  bios = "seabios"
  qemu_agent = true
  scsi_controller = "virtio-scsi-pci"
  cpu_type = "x86-64-v2-AES"
  sockets = 1
  cores = 4
  memory = 4096

  communicator = "ssh"
  ssh_handshake_attempts = 5
  ssh_pty = true
  ssh_timeout = "20m"
  ssh_username = "root"
  ssh_password = var.ssh_password

  cloud_init = "true"
  cloud_init_storage_pool = "local"
}

build {
  sources = ["proxmox-iso.debian13"]
}

variable "proxmox_token" {
  type = string
  sensitive = true
}

variable "ssh_password" {
  type = string
  sensitive = true
}
