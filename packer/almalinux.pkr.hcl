packer {
  required_plugins {
    xenserver = {
      version = ">= v0.7.0"
      source = "github.com/ddelnano/xenserver"
    }
  }
}

source "xenserver-iso" "almalinux" {

  vm_name = "ALMALINUX-10.3-TPL"

  vcpus_max = 8
  vm_memory = 1024

  vm_tags = ["linux","template"]

  iso_checksum = "none"
  iso_url = "https://repo.almalinux.org/almalinux/10/isos/x86_64/AlmaLinux-10.3-x86_64-minimal.iso"
  remote_host = var.xcp_host
  remote_username = var.xcp_username
  remote_password = var.xcp_password

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password

  boot_command = [
    "<up>",
    "e",
    "<wait>",
    "<down><down>",
    "<leftCtrlOn>e<leftCtrlOff>",
    "<spacebar>",
    "biosdevname=0",
    "<spacebar>",
    "ip=dhcp",
    "<spacebar>",
    "net.ifnames=0",
    "<spacebar>",
    "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/almalinux-kickstart.cfg",
    "<leftCtrlOn>x<leftCtrlOff>"
  ]
  boot_wait = "10s"
  http_directory = "packer/http"

  clone_template = "AlmaLinux 10"

  disk_name = "HDD_OS"
  disk_size = 40 * 1024

  firmware = "uefi"

  format = "none"

  keep_vm = "on_success"

  network_names = ["Templates"]

  sr_iso_name = "ISOs"

}

build {
  sources = ["xenserver-iso.almalinux"]
}

variable "xcp_host" {
  type = string
}

variable "xcp_username" {
  type = string
}

variable "xcp_password" {
  type = string
  sensitive = true
}

variable "ssh_username" {
  type = string
}

variable "ssh_password" {
  type = string
  sensitive = true
}
