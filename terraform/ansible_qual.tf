resource "ansible_host" "docker-qual-01" {
  name = proxmox_virtual_environment_vm.docker-qual-01.name
  groups = ["docker"]
  variables = {
    ansible_user = "jeremy"
    ansible_host = join("",proxmox_virtual_environment_vm.docker-qual-01.ipv4_addresses[2])
    ansible_private_key_file = "~/.ssh/id_ed25519"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "mail-qual-01" {
  name = proxmox_virtual_environment_vm.mail-qual-01.name
  groups = ["mail"]
  variables = {
    ansible_user = "jeremy"
    ansible_host = join("",proxmox_virtual_environment_vm.mail-qual-01.ipv4_addresses[2])
    ansible_private_key_file = "~/.ssh/id_ed25519"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "storage-qual-01" {
  name = proxmox_virtual_environment_vm.storage-qual-01.name
  groups = ["storage"]
  variables = {
    ansible_user = "jeremy"
    ansible_host = join("",proxmox_virtual_environment_vm.storage-qual-01.ipv4_addresses[2])
    ansible_private_key_file = "~/.ssh/id_ed25519"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "wazuh-qual-01" {
  name = proxmox_virtual_environment_vm.wazuh-qual-01.name
  groups = ["wazuh"]
  variables = {
    ansible_user = "jeremy"
    ansible_host = join("",proxmox_virtual_environment_vm.wazuh-qual-01.ipv4_addresses[2])
    ansible_private_key_file = "~/.ssh/id_ed25519"
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
