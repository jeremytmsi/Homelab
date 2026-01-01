resource "ansible_host" "SRV-QUAL-01" {
  name = proxmox_virtual_environment_vm.SRV-QUAL-01.name
  groups = ["qual","docker"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.SRV-QUAL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "STORAGE-QUAL-01" {
  name = proxmox_virtual_environment_vm.STORAGE-QUAL-01.name
  groups = ["qual","storage"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.STORAGE-QUAL-01.ipv4_addresses[2])
  }
}

resource "ansible_host" "VPS-QUAL-01" {
  name = "vps-01.qual.jeremytomasi.fr"
  groups = ["qual","docker","vps"]
  variables = {
    ansible_user = "ansible"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = "51.254.129.11"
  }
}
