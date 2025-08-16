resource "ibm_pi_instance" "vm" {
  pi_cloud_instance_id = var.service_instance_id
  pi_instance_name     = var.instance_name
  pi_image_name        = var.image_name
  pi_key_names         = [var.ssh_key_name]
  pi_sys_type          = var.sys_type
  pi_proc_type         = var.proc_type
  pi_processors        = var.processors
  pi_memory            = var.memory_mb
  pi_networks = [{
    network_id = var.network_id
  }]
  tags = var.tags
}

