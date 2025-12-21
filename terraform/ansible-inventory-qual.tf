resource "ansible_host" "SRV-QUAL-01" {
  name = proxmox_virtual_environment_vm.SRV-QUAL-01.name
  groups = ["proxmox","services","qual"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.SRV-QUAL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MAIL-QUAL-01" {
  name = proxmox_virtual_environment_vm.MAIL-QUAL-01.name
  groups = ["proxmox","mail","qual"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MAIL-QUAL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "MONITOR-QUAL-01" {
  name = proxmox_virtual_environment_vm.MONITOR-QUAL-01.name
  groups = ["proxmox","qual","monitoring"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.MONITOR-QUAL-01.ipv4_addresses[2])
  }
}
