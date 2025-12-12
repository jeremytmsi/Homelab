resource "ansible_host" "Spa" {
  name = proxmox_virtual_environment_vm.Spa.name
  groups = ["servers","compute"]
  variables = {
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
    ansible_host = join("",proxmox_virtual_environment_vm.Spa.ipv4_addresses[2])
  }
}

resource "ansible_host" "Monaco" {
  name = "Monaco"
  groups = ["servers","storage","tailscale"]
  variables = {
    ansible_host = "192.168.1.253"
    ansible_user = "jeremy"
    ansible_ssh_private_key_file = var.ssh_private_key
  }
}

variable "ssh_private_key" {
  type = string
}
