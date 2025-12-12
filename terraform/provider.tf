terraform {
  required_providers {
    proxmox = {
      version = ">= 0.87.0"
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_url
  api_token = var.proxmox_token
  insecure = true
}
