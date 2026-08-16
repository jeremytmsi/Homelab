resource "ansible_host" "vm-bunkerweb-prod" {
  name = proxmox_virtual_environment_vm.vm-bunkerweb-prod.name
  groups = []
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-bunkerweb-prod.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-docker-prod" {
  name = proxmox_virtual_environment_vm.vm-docker-prod.name
  groups = ["docker"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-docker-prod.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-wazuh-prod" {
  name = proxmox_virtual_environment_vm.vm-wazuh-prod.name
  groups = ["wazuh"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-wazuh-prod.ipv4_addresses[1])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
