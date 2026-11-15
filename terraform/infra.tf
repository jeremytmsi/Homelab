data "xenorchestra_template" "almalinux-tpl" {
  name_label = "ALMALINUX-10.2-TPL"
}

data "xenorchestra_pool" "F1" {
  name_label = "F1"
}

data "xenorchestra_sr" "VMs" {
  name_label = "VMs"
}

data "xenorchestra_network" "vlan_servers" {
  name_label = "Pool-wide network 0"
}

data "xenorchestra_network" "vlan_mgmt" {
  name_label = "MGMT"
}

data "xenorchestra_network" "vlan_iscsi" {
  name_label = "ISCSI"
}

resource "xenorchestra_vm" "VM_DOCKER" {
  name_label = "VM_DOCKER"
  name_description = "VM for Docker created from OpenTofu"
  auto_poweron = true

  cpus = 4
  memory_max = 8192 * 1024 * 1024

  disk {
    sr_id = data.xenorchestra_sr.VMs.id
    name_label = "DOCKER_VM_OS"
    size = 40 * 1024 * 1024 * 1024
  }

  disk {
    sr_id = data.xenorchestra_sr.VMs.id
    name_label = "DOCKER_VM_NEXTCLOUD"
    size = 150 * 1024 * 1024 * 1024
  }

  disk {
    sr_id = data.xenorchestra_sr.VMs.id
    name_label = "DOCKER_VM_IMMICH"
    size = 50 * 1024 * 1024 * 1024
  }

  network {
    network_id = data.xenorchestra_network.vlan_servers.id
    expected_ip_cidr = "10.0.10.0/24"
  }

  network {
    network_id = data.xenorchestra_network.vlan_mgmt.id
    expected_ip_cidr = "10.0.99.0/24"
  }

  network {
    network_id = data.xenorchestra_network.vlan_iscsi.id
  }

  cloud_config = templatefile("cloud_config.tftpl",{
    hostname = "DOCKER-VM"
  })

  cloud_network_config = templatefile("cloud_network_config.tftpl",{
    ip_address = "10.0.10.1/24",
    gateway = "10.0.10.254",
    dns = "10.0.10.254",
    ip_address_mgmt = "10.0.99.1/24",
    gateway_mgmt = "10.0.99.254"
  })

  template = data.xenorchestra_template.almalinux-tpl.id
  clone_type = "fast"
  hvm_boot_firmware = "uefi"
}

resource "xenorchestra_vm" "VM_UNIFI" {
  name_label = "VM_UNIFI"
  name_description = "VM for Unifi OS created from OpenTofu"
  auto_poweron = true

  cpus = 2
  memory_max = 2048 * 1024 * 1024

  disk {
    sr_id = data.xenorchestra_sr.VMs.id
    name_label = "UNIFI_VM_OS"
    size = 40 * 1024 * 1024 * 1024
  }

  network {
    network_id = data.xenorchestra_network.vlan_servers.id
    expected_ip_cidr = "10.0.10.0/24"
  }

  network {
    network_id = data.xenorchestra_network.vlan_mgmt.id
    expected_ip_cidr = "10.0.99.0/24"
  }

  cloud_config = templatefile("cloud_config.tftpl",{
    hostname = "UNIFI-VM"
  })

  cloud_network_config = templatefile("cloud_network_config.tftpl",{
    ip_address = "10.0.10.2/24",
    gateway = "10.0.10.254",
    dns = "10.0.10.254",
    ip_address_mgmt = "10.0.99.2/24",
    gateway_mgmt = "10.0.99.254"
  })

  template = data.xenorchestra_template.almalinux-tpl.id
  clone_type = "fast"
  hvm_boot_firmware = "uefi"
}
