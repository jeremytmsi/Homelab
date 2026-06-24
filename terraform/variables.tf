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

variable "ansible_user" {
  type = string
}

variable "ansible_ssh_key" {
  type = string
}
