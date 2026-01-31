resource "ansible_host" "docker-prod-01" {
  name = proxmox_virtual_environment_vm.docker-prod-01.name
  groups = ["prod","docker"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.docker-prod-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "monitoring-prod-01" {
  name = proxmox_virtual_environment_vm.monitoring-prod-01.name
  groups = ["prod","monitoring"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.monitoring-prod-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "storage-prod-01" {
  name = proxmox_virtual_environment_vm.storage-prod-01.name
  groups = ["prod","storage"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.storage-prod-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
