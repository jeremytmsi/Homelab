resource "ansible_host" "SRV-PROD-01" {
  name = proxmox_virtual_environment_vm.SRV-PROD-01.name
  groups = ["proxmox","services","PROD"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.SRV-PROD-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MAIL-PROD-01" {
  name = proxmox_virtual_environment_vm.MAIL-PROD-01.name
  groups = ["proxmox","mail","PROD"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MAIL-PROD-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MONITOR-PROD-01" {
  name = proxmox_virtual_environment_vm.MONITOR-PROD-01.name
  groups = ["proxmox","PROD"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MONITOR-PROD-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "STORAGE-01" {
  name = "STORAGE-01"
  groups = ["PROD"]
  variables = {
    ansible_host = "192.168.1.253"
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
  }
}

resource "ansible_host" "VPS-PROD-01" {
  name = "VPS-01"
  groups = ["services","PROD"]
  variables = {
    ansible_host = "91.134.240.46",
    ansible_user = "ansible",
    ansible_ssh_private_key_file = var.ssh_private_key
  }
}
