provider "proxmox" {
  endpoint = "https://135.125.180.48:8006"
  api_token = var.proxmox_token
  insecure = true
}
