terraform {
  required_providers {
    proxmox = {
      version = ">= 0.87.0"
      source = "bpg/proxmox"
    }
    ansible = {
      version = ">= 1.3.0"
      source = "ansible/ansible"
    }
  }
}
