resource "ansible_host" "DOCKER-QUAL-01" {
  name = proxmox_virtual_environment_vm.DOCKER-QUAL-01.name
  groups = ["qual"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.DOCKER-QUAL-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "NEXTCLOUD-QUAL-01" {
  name = proxmox_virtual_environment_vm.NEXTCLOUD-QUAL-01.name
  groups = ["qual"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.NEXTCLOUD-QUAL-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "NEXTCLOUDDB-QUAL-01" {
  name = proxmox_virtual_environment_vm.NEXTCLOUDDB-QUAL-01.name
  groups = ["qual"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.NEXTCLOUDDB-QUAL-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "MONITORING-QUAL-01" {
  name = proxmox_virtual_environment_vm.MONITORING-QUAL-01.name
  groups = ["qual"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.MONITORING-QUAL-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "STORAGE-QUAL-01" {
  name = proxmox_virtual_environment_vm.STORAGE-QUAL-01.name
  groups = ["qual","storage"]
  variables = {
    ansible_user = var.vm_ssh_user
    ansible_host = join("",proxmox_virtual_environment_vm.STORAGE-QUAL-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = var.ssh_private_key_file
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
