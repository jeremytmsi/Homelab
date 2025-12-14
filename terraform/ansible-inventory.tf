resource "ansible_host" "SRV-01" {
  name = proxmox_virtual_environment_vm.SRV-01.name
  groups = ["servers"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.SRV-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MAIL-01" {
  name = proxmox_virtual_environment_vm.MAIL-01.name
  groups = ["servers"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MAIL-01.ipv4_addresses[2])
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

variable "ssh_private_key" {
  type = string
}
