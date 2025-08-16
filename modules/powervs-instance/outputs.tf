output "instance_id" {
  value = ibm_pi_instance.vm.id
}

output "instance_name" {
  value = ibm_pi_instance.vm.pi_instance_name
}

output "private_ip" {
  value = try(ibm_pi_instance.vm.pi_networks[0].ip_address, null)
}

output "public_ip" {
  value = try(ibm_pi_instance.vm.pi_networks[0].external_ip, null)
}

output "console_url" {
  value = ibm_pi_instance.vm.console_url
}

output "network_ids" {
  value = var.network_ids
}

output "image" {
  value = data.ibm_pi_image.selected.name
}

output "profile" {
  value = var.sys_type
}
