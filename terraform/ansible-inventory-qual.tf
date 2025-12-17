resource "ansible_host" "SRV-QUAL-01" {
  name = proxmox_virtual_environment_vm.SRV-QUAL-01.name
  groups = ["proxmox","services","QUAL"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.SRV-QUAL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MAIL-QUAL-01" {
  name = proxmox_virtual_environment_vm.MAIL-QUAL-01.name
  groups = ["proxmox","mail","QUAL"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MAIL-QUAL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MONITOR-QUAL-01" {
  name = proxmox_virtual_environment_vm.MONITOR-QUAL-01.name
  groups = ["proxmox","QUAL"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MONITOR-QUAL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "VPS-QUAL-01" {
  name = proxmox_virtual_environment_vm.VPS-QUAL-01.name
  groups = ["proxmox","QUAL"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.VPS-QUAL-01.ipv4_addresses[2])
  }
}
