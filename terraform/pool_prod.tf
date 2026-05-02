resource "proxmox_virtual_environment_pool" "prod" {
  pool_id = "PROD"
}

resource "proxmox_virtual_environment_pool_membership" "docker-prod-01" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.docker-prod-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "mail-prod-01" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.mail-prod-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "storage-prod-01" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.storage-prod-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "wazuh-prod-01" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.wazuh-prod-01.vm_id
}
