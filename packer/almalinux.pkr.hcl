packer {
  required_plugins {
    name = {
      version = ">= 1.2.2"
      source = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "almalinux" {
  proxmox_url = "http://135.125.180.48:8006/api2/json"
  node = "Suzuka"
  username = "packer@pve!packer"
  token = var.proxmox_token
  insecure_skip_tls_verify = true

  template_name = "ALMALINUX-10-TPL"
  vm_name = "ALMALINUX-10-TPL"
  template_description = "Almalinux 10 template"
  tags = "template;linux"
  vm_id = 190
  pool = "TEMPLATE"
  os = "l26"
  machine = "q35"

  boot_iso {
    type = "scsi"
    iso_file = "local:iso/AlmaLinux-10.1-x86_64-minimal.iso"
    unmount = true
    iso_checksum = "none"
  }
  boot_command = [
    "<up>",
    "e",
    "<wait>",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "ip=192.168.30.1::192.168.30.254:255.255.255.0:alma-template:eth0:none:9.9.9.9",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-kickstart.cfg",
    "<leftCtrlOn>x<leftCtrlOff>"
  ]
  boot_wait = "10s"
  http_directory = "packer/http"
  http_interface = "utun1"

  disks {
    type = "scsi"
    storage_pool = "local"
    disk_size = "60G"
    format = "raw"
  }

  network_adapters {
    bridge = "vmbr1"
    model = "virtio"
    vlan_tag = "30"
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
  ssh_username = "root"
  ssh_password = var.ssh_password

  cloud_init = "true"
  cloud_init_storage_pool = "local"
}

build {
  sources = ["proxmox-iso.almalinux"]
}

variable "proxmox_token" {
  type = string
  sensitive = true
}

variable "ssh_password" {
  type = string
  sensitive = true
}
