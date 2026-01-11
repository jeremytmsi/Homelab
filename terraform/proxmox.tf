provider "proxmox" {
  endpoint = "https://10.0.0.1:8006"
  api_token = var.proxmox_token
  insecure = true
}
