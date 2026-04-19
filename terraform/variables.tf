variable "proxmox_url" {
  type = string
}

variable "proxmox_token" {
  type = string
  sensitive = true
}

variable "node_name" {
  type = string
}

variable "vm_ssh_user" {
  type = string
}
