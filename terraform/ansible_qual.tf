resource "ansible_host" "docker-qual-01" {
  name = proxmox_virtual_environment_vm.docker-qual-01.name
  groups = ["qual","docker"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.docker-qual-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_qual"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "mail-qual-01" {
  name = proxmox_virtual_environment_vm.mail-qual-01.name
  groups = ["qual"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.mail-qual-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_qual"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "storage-qual-01" {
  name = proxmox_virtual_environment_vm.storage-qual-01.name
  groups = ["qual","storage"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.storage-qual-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_qual"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "wazuh-qual-01" {
  name = proxmox_virtual_environment_vm.wazuh-qual-01.name
  groups = ["qual","wazuh"]
  variables = {
    ansible_user = "ansible"
    ansible_host = join("",proxmox_virtual_environment_vm.wazuh-qual-01.ipv4_addresses[2])
    ansible_ssh_private_key_file = "~/.ssh/ansible_config_qual"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
