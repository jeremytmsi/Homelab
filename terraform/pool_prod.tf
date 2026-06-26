resource "proxmox_virtual_environment_pool" "prod" {
  pool_id = "PROD"
}

resource "proxmox_pool_membership" "vm-firewall-prod" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = 100
}

resource "proxmox_pool_membership" "vm-docker-prod" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.vm-docker-prod.vm_id
}

resource "proxmox_pool_membership" "vm-mail-prod" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.vm-mail-prod.vm_id
}

resource "proxmox_pool_membership" "vm-storage-prod" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.vm-storage-prod.vm_id
}

resource "proxmox_pool_membership" "vm-wazuh-prod" {
  pool_id = proxmox_virtual_environment_pool.prod.id
  vm_id = proxmox_virtual_environment_vm.vm-wazuh-prod.vm_id
}
