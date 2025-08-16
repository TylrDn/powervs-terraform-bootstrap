output "aix_instance_id" {
  value = module.aix.instance_id
}

output "linux_instance_id" {
  value = module.linux.instance_id
}

output "network_id" {
  value = ibm_pi_network.net.network_id
}

output "aix_ip" {
  value = module.aix.ip_address
}

output "linux_ip" {
  value = module.linux.ip_address
}
