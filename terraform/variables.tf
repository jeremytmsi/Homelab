variable "xo_host" {
  type = string
}

variable "xo_token" {
  type = string
  sensitive = true
}

variable "ansible_user" {
  type = string
}

variable "ansible_ssh_key" {
  type = string
}
