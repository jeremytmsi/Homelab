resource "ansible_host" "docker-prod-01" {
  name = proxmox_virtual_environment_vm.docker-prod-01.name
  groups = ["prod","docker"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.docker-prod-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_prod"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "mail-prod-01" {
  name = proxmox_virtual_environment_vm.mail-prod-01.name
  groups = ["prod"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.mail-prod-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_prod"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "storage-prod-01" {
  name = proxmox_virtual_environment_vm.storage-prod-01.name
  groups = ["prod","storage"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.storage-prod-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_prod"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "wazuh-prod-01" {
  name = proxmox_virtual_environment_vm.wazuh-prod-01.name
  groups = ["prod","wazuh"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.wazuh-prod-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_prod"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "monitoring-prod-01" {
  name = "monitoring.prod.jeremytomasi.fr"
  groups = ["prod","docker", "vps"]
  variables = {
    ansible_user = "ansible"
    ansible_host = "51.254.129.11"
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_prod"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
