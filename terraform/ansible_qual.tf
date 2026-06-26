resource "ansible_host" "vm-docker-qual" {
  name = proxmox_virtual_environment_vm.vm-docker-qual.name
  groups = ["qual","docker"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-docker-qual.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-mail-qual" {
  name = proxmox_virtual_environment_vm.vm-mail-qual.name
  groups = ["qual","mail"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-mail-qual.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-storage-qual" {
  name = proxmox_virtual_environment_vm.vm-storage-qual.name
  groups = ["qual","storage"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-storage-qual.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-wazuh-qual" {
  name = proxmox_virtual_environment_vm.vm-wazuh-qual.name
  groups = ["qual","wazuh"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-wazuh-qual.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-unifi-qual" {
  name = proxmox_virtual_environment_vm.vm-unifi-qual.name
  groups = ["qual","unifi"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-unifi-qual.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

