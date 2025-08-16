output "instance_id" {
  value = ibm_pi_instance.vm.id
}

output "ip_address" {
  value = try(ibm_pi_instance.vm.pi_networks[0].ip_address, null)
}

output "status" {
  value = ibm_pi_instance.vm.status
}
