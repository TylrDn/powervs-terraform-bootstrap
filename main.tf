locals {
  aix_profile_parts   = split("-", var.aix_profile)
  aix_proc_mem        = split("x", local.aix_profile_parts[1])
  aix_processors      = tonumber(local.aix_proc_mem[0])
  aix_memory_mb       = tonumber(local.aix_proc_mem[1]) * 1024

  linux_profile_parts = split("-", var.linux_profile)
  linux_proc_mem      = split("x", local.linux_profile_parts[1])
  linux_processors    = tonumber(local.linux_proc_mem[0])
  linux_memory_mb     = tonumber(local.linux_proc_mem[1]) * 1024

  base_tags = [
    "project=powervs-bootstrap",
    "owner=${var.owner}",
    "env=${var.environment}"
  ]
}

resource "ibm_resource_group" "rg" {
  name = var.resource_group
  tags = local.base_tags
}

data "ibm_pi_key" "ssh" {
  pi_cloud_instance_id = var.powervs_service_instance_id
  name                 = var.ssh_key_name
}

resource "ibm_pi_network" "net" {
  pi_cloud_instance_id = var.powervs_service_instance_id
  pi_network_name      = "bootstrap-net"
  type                 = "pub-vlan"
  tags                 = local.base_tags
}

module "aix" {
  source              = "./modules/powervs-instance"
  instance_name       = "aix-lpar"
  image_name          = var.aix_image_name
  ssh_key_name        = var.ssh_key_name
  network_id          = ibm_pi_network.net.network_id
  processors          = local.aix_processors
  memory_mb           = local.aix_memory_mb
  sys_type            = "s922"
  proc_type           = "shared"
  tags                = concat(local.base_tags, ["os=aix"])
  service_instance_id = var.powervs_service_instance_id
}

module "linux" {
  source              = "./modules/powervs-instance"
  instance_name       = "linux-lpar"
  image_name          = var.linux_image_name
  ssh_key_name        = var.ssh_key_name
  network_id          = ibm_pi_network.net.network_id
  processors          = local.linux_processors
  memory_mb           = local.linux_memory_mb
  sys_type            = "s922"
  proc_type           = "shared"
  tags                = concat(local.base_tags, ["os=linux"])
  service_instance_id = var.powervs_service_instance_id
}

