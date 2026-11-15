resource "ansible_host" "DOCKER-VM" {
  name = "DOCKER-VM"
  groups = ["docker"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = "10.0.99.1"
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "UNIFI-VM" {
  name = "UNIFI-VM"
  variables = {
    ansible_user = var.ansible_user
    ansible_host = "10.0.99.2"
    ansible_private_key_file = var.ansible_ssh_key
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
