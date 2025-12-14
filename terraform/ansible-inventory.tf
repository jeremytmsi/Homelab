resource "ansible_host" "SRV-01" {
  name = proxmox_virtual_environment_vm.SRV-01.name
  groups = ["servers","proxmox","services"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.SRV-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MAIL-01" {
  name = proxmox_virtual_environment_vm.MAIL-01.name
  groups = ["servers","proxmox","mail"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MAIL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MONITOR-01" {
  name = proxmox_virtual_environment_vm.MONITOR-01.name
  groups = ["servers","proxmox"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MONITOR-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "STORAGE-01" {
  name = "STORAGE-01"
  groups = ["servers"]
  variables = {
    ansible_host = "192.168.1.253"
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
  }
}

resource "ansible_host" "VPS-01" {
  name = "VPS-01"
  groups = ["servers","services"]
  variables = {
    ansible_host = "91.134.240.46",
    ansible_user = "debian",
    ansible_ssh_private_key_file = var.ssh_private_key
  }
}

variable "ssh_private_key" {
  type = string
}
