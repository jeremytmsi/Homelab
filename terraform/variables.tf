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

variable "vm_ssh_keys" {
  type = list(string)
}

variable "ssh_private_key_file" {
  type = string
}
