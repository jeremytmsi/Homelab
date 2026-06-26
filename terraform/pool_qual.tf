resource "proxmox_virtual_environment_pool" "qual" {
  pool_id = "QUAL"
}

resource "proxmox_pool_membership" "vm-docker-qual" {
  pool_id = proxmox_virtual_environment_pool.qual.id
  vm_id = proxmox_virtual_environment_vm.vm-docker-qual.vm_id
}

resource "proxmox_pool_membership" "vm-mail-qual" {
  pool_id = proxmox_virtual_environment_pool.qual.id
  vm_id = proxmox_virtual_environment_vm.vm-mail-qual.vm_id
}

resource "proxmox_pool_membership" "vm-storage-qual" {
  pool_id = proxmox_virtual_environment_pool.qual.id
  vm_id = proxmox_virtual_environment_vm.vm-storage-qual.vm_id
}

resource "proxmox_pool_membership" "vm-wazuh-qual" {
  pool_id = proxmox_virtual_environment_pool.qual.id
  vm_id = proxmox_virtual_environment_vm.vm-wazuh-qual.vm_id
}

resource "proxmox_pool_membership" "vm-unifi-qual" {
  pool_id = proxmox_virtual_environment_pool.qual.id
  vm_id = proxmox_virtual_environment_vm.vm-unifi-qual.vm_id
}


