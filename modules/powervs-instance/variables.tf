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
  description = "Processor type"
  default     = "shared"
  validation {
    condition     = contains(["shared", "dedicated"], var.proc_type)
    error_message = "proc_type must be 'shared' or 'dedicated'"
  }
}

variable "processors" {
  type        = number
  description = "Number of processors"
  validation {
    condition     = var.processors > 0
    error_message = "processors must be > 0"
  }
}

variable "memory_mb" {
  type        = number
  description = "Memory in MB"
  validation {
    condition     = var.memory_mb > 0
    error_message = "memory_mb must be > 0"
  }
}

variable "sys_type" {
  type        = string
  description = "System type"
  default     = "s922"
}

variable "image_name" {
  type        = string
  description = "Image name (exact match)"
  default     = null
}

variable "image_regex" {
  type        = string
  description = "Image name regex used when image_name is null"
  default     = "^RHEL.*"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name"
}

variable "network_id" {
  type        = string
  description = "Network ID to attach"
}

variable "owner" {
  type        = string
  description = "Owner tag"
}

variable "environment" {
  type        = string
  description = "Environment tag"
}

variable "cost_center" {
  type        = string
  description = "Cost center tag"
}

variable "project" {
  type        = string
  description = "Project tag"
}

variable "extra_tags" {
  type        = list(string)
  description = "Additional tags"
  default     = []
}
