variable "ibmcloud_api_key" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "powervs_service_instance_id" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "owner" {
  type    = string
  default = "unknown"
}

variable "environment" {
  type    = string
  default = "dev"
}

# Placeholder for a future HA cluster example.
module "bootstrap" {
  source = "../.."

  ibmcloud_api_key          = var.ibmcloud_api_key
  region                    = var.region
  zone                      = var.zone
  powervs_service_instance_id = var.powervs_service_instance_id
  ssh_key_name              = var.ssh_key_name
  owner                     = var.owner
  environment               = var.environment
}
