resource "ansible_host" "docker-qual-01" {
  name = proxmox_virtual_environment_vm.docker-qual-01.name
  groups = ["qual","docker"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.docker-qual-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "monitoring-qual-01" {
  name = proxmox_virtual_environment_vm.monitoring-qual-01.name
  groups = ["qual","monitoring"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.monitoring-qual-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "storage-qual-01" {
  name = proxmox_virtual_environment_vm.storage-qual-01.name
  groups = ["qual","storage"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.storage-qual-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
