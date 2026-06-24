resource "ansible_host" "vm-docker-prod" {
  name = proxmox_virtual_environment_vm.vm-docker-prod.name
  groups = ["prod","docker"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-docker-prod.ipv4_addresses[2])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-mail-prod" {
  name = proxmox_virtual_environment_vm.vm-mail-prod.name
  groups = ["prod","mail"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-mail-prod.ipv4_addresses[2])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-storage-prod" {
  name = proxmox_virtual_environment_vm.vm-storage-prod.name
  groups = ["prod","storage"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-storage-prod.ipv4_addresses[2])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vm-wazuh-prod" {
  name = proxmox_virtual_environment_vm.vm-wazuh-prod.name
  groups = ["prod","wazuh"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = join("",proxmox_virtual_environment_vm.vm-wazuh-prod.ipv4_addresses[2])
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "vps-monitoring-prod" {
  name = "monitoring.prod.jeremytomasi.fr"
  groups = ["prod","docker", "vps"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = "51.254.129.11"
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
