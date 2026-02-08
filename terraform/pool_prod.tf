resource "proxmox_virtual_environment_pool" "PROD" {
  pool_id = "PROD"
}

resource "proxmox_virtual_environment_pool_membership" "firewall" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = 100
}

resource "proxmox_virtual_environment_pool_membership" "docker-prod-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.docker-prod-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "monitoring-prod-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.monitoring-prod-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "storage-prod-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.storage-prod-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "wazuh-prod-01" {
  pool_id = proxmox_virtual_environment_pool.PROD.id
  vm_id = proxmox_virtual_environment_vm.wazuh-prod-01.vm_id
}
