resource "ansible_host" "DOCKER-VM" {
  name = "DOCKER-VM"
  groups = ["docker"]
  variables = {
    ansible_user = var.ansible_user
    ansible_host = "10.0.99.2"
    ansible_password = var.ansible_password
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "UNIFI-VM" {
  name = "UNIFI-VM"
  variables = {
    ansible_user = var.ansible_user
    ansible_host = "10.0.99.3"
    ansible_password = var.ansible_password
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}

resource "ansible_host" "WAZUH-VM" {
  name = "WAZUH-VM"
  variables = {
    ansible_user = var.ansible_user
    ansible_host = "10.0.99.4"
    ansible_password = var.ansible_password
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no"
  }
}
