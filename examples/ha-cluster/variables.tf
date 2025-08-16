variable "ibmcloud_api_key" { type = string }
variable "region" { type = string }
variable "zone" { type = string }
variable "powervs_service_instance_id" { type = string }
variable "resource_group" { type = string }
variable "ssh_key_name" { type = string }
variable "profile" { type = string default = "bx2-4x16" }
variable "aix_image_name" { type = string default = "AIX 7.3 TLx" }
variable "rhel_image_name" { type = string default = "RHEL 9 for Power" }
variable "os" { type = string default = "rhel" }
variable "owner" { type = string default = "user" }
variable "environment" { type = string default = "dev" }
variable "cost_center" { type = string default = "0000" }
variable "project" { type = string default = "powervs-bootstrap" }
variable "enable_public_network" { type = bool default = false }
