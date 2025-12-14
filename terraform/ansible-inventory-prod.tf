resource "ansible_host" "SRV-PROD-01" {
  name = proxmox_virtual_environment_vm.SRV-PROD-01.name
  groups = ["proxmox","services","prod"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.SRV-PROD-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MAIL-PROD-01" {
  name = proxmox_virtual_environment_vm.MAIL-PROD-01.name
  groups = ["proxmox","mail","prod"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MAIL-PROD-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MONITOR-01" {
  name = proxmox_virtual_environment_vm.MONITOR-PROD-01.name
  groups = ["proxmox","prod"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MONITOR-PROD-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "STORAGE-PROD-01" {
  name = "STORAGE-01"
  groups = ["prod"]
  variables = {
    ansible_host = "192.168.1.253"
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
  }
}

resource "ansible_host" "VPS-PROD-01" {
  name = "VPS-01"
  groups = ["services","prod"]
  variables = {
    ansible_host = "91.134.240.46",
    ansible_user = "debian",
    ansible_ssh_private_key_file = var.ssh_private_key
  }
}

variable "ssh_private_key" {
  type = string
}
