resource "proxmox_virtual_environment_pool" "QUAL" {
  pool_id = "QUAL"
}

resource "proxmox_virtual_environment_pool_membership" "DOCKER-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.DOCKER-QUAL-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "NEXTCLOUD-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.NEXTCLOUD-QUAL-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "NEXTCLOUDDB-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.NEXTCLOUDDB-QUAL-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "MONITORING-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.MONITORING-QUAL-01.vm_id
}

resource "proxmox_virtual_environment_pool_membership" "STORAGE-QUAL-01" {
  pool_id = proxmox_virtual_environment_pool.QUAL.id
  vm_id = proxmox_virtual_environment_vm.STORAGE-QUAL-01.vm_id
}
