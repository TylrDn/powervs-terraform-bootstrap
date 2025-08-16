variable "ibmcloud_api_key" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

module "bootstrap" {
  source = "../.."
  ibmcloud_api_key          = var.ibmcloud_api_key
  region                    = var.region
  zone                      = var.zone
  powervs_service_instance_id = var.powervs_service_instance_id
  resource_group            = var.resource_group
  ssh_key_name              = var.ssh_key_name
  aix_image_name            = var.aix_image_name
  linux_image_name          = var.linux_image_name
  aix_profile               = var.aix_profile
  linux_profile             = var.linux_profile
  owner                     = var.owner
  environment               = var.environment
  cost_center               = var.cost_center
  project                   = var.project
}
