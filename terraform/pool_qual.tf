resource "proxmox_virtual_environment_pool" "QUAL" {
  pool_id = "QUAL"
}

resource "proxmox_virtual_environment_pool_membership" "docker-qual-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.docker-qual-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "monitoring-qual-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.monitoring-qual-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "storage-qual-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.storage-qual-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "wazuh-qual-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.wazuh-qual-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "guacamole-qual-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.guacamole-qual-01.vm_id
}
