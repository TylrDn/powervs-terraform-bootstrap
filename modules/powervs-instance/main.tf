locals {
  tags = concat([
    "owner=${var.owner}",
    "env=${var.environment}",
    "cost_center=${var.cost_center}",
    "project=${var.project}"
  ], var.extra_tags)
}

data "ibm_pi_image" "selected" {
  pi_cloud_instance_id = var.service_instance_id
  name      = var.image_name
  name_regex = var.image_name == null ? var.image_regex : null
}

data "ibm_pi_instance_profile" "profile" {
  pi_cloud_instance_id = var.service_instance_id
  name                 = var.sys_type
}

resource "ibm_pi_instance" "vm" {
  pi_cloud_instance_id = var.service_instance_id
  pi_instance_name     = var.instance_name
  pi_image_id          = data.ibm_pi_image.selected.id
  pi_key_names         = [var.ssh_key_name]
  pi_sys_type          = data.ibm_pi_instance_profile.profile.name
  pi_proc_type         = var.proc_type
  pi_processors        = var.processors
  pi_memory            = var.memory_mb
  pi_networks = [{
    network_id = var.network_id
  }]
  tags = local.tags
}
