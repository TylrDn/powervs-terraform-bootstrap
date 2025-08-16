variable "service_instance_id" {
  type        = string
  description = "PowerVS service instance ID"
}

variable "instance_name" {
  type        = string
  description = "Instance name"
}

variable "proc_type" {
  type        = string
  description = "Processor type (shared or dedicated)"
  default     = "shared"
}

variable "processors" {
  type        = number
  description = "Number of processors"
}

variable "memory_mb" {
  type        = number
  description = "Memory in MB"
}

variable "sys_type" {
  type        = string
  description = "System type"
  default     = "s922"
}

variable "image_name" {
  type        = string
  description = "Image name"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name"
}

variable "network_id" {
  type        = string
  description = "Network ID to attach"
}

variable "tags" {
  type        = list(string)
  description = "List of tags"
  default     = []
}
