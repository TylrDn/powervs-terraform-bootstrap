terraform {
  required_version = ">= 1.6.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.62.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
  zone             = var.zone
}

locals {
  parts      = split("-", var.profile)
  proc_mem   = split("x", local.parts[1])
  processors = tonumber(local.proc_mem[0])
  memory_mb  = tonumber(local.proc_mem[1]) * 1024
  image      = var.os == "aix" ? var.aix_image_name : var.rhel_image_name
  base_tags  = [
    "project=${var.project}",
    "owner=${var.owner}",
    "env=${var.environment}",
    "cost_center=${var.cost_center}"
  ]
}

resource "ibm_pi_network" "net_a" {
  pi_cloud_instance_id = var.powervs_service_instance_id
  pi_network_name      = "ha-net-a"
  type                 = "vlan"
  tags                 = local.base_tags
}

resource "ibm_pi_network" "net_b" {
  pi_cloud_instance_id = var.powervs_service_instance_id
  pi_network_name      = "ha-net-b"
  type                 = "vlan"
  tags                 = local.base_tags
}

module "node_a" {
  source              = "../../modules/powervs-instance"
  service_instance_id = var.powervs_service_instance_id
  instance_name       = "node-a"
  image_name          = local.image
  ssh_key_name        = var.ssh_key_name
  network_id          = ibm_pi_network.net_a.network_id
  processors          = local.processors
  memory_mb           = local.memory_mb
  sys_type            = "s922"
  proc_type           = "shared"
  owner               = var.owner
  environment         = var.environment
  cost_center         = var.cost_center
  project             = var.project
  extra_tags          = ["role=ha", "node=a"]
}

module "node_b" {
  source              = "../../modules/powervs-instance"
  service_instance_id = var.powervs_service_instance_id
  instance_name       = "node-b"
  image_name          = local.image
  ssh_key_name        = var.ssh_key_name
  network_id          = ibm_pi_network.net_b.network_id
  processors          = local.processors
  memory_mb           = local.memory_mb
  sys_type            = "s922"
  proc_type           = "shared"
  owner               = var.owner
  environment         = var.environment
  cost_center         = var.cost_center
  project             = var.project
  extra_tags          = ["role=ha", "node=b"]
}
