provider "proxmox" {
  endpoint = var.proxmox_url
  api_token = var.proxmox_token
  insecure = true
}
