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
    condition     = var.processors > 0 && floor(var.processors) == var.processors
    error_message = "processors must be a positive integer"
  }
}

variable "memory_mb" {
  type        = number
  description = "Memory in MB"
  validation {
    condition     = var.memory_mb > 0 && floor(var.memory_mb) == var.memory_mb
    error_message = "memory_mb must be a positive integer"
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
  description = "Image name regex used when image_name is unset"
  default     = null
  validation {
    condition = (
      var.image_name != null && var.image_name != ""
    ) || (
      var.image_regex != null && var.image_regex != ""
    )
    error_message = "Provide image_name or a non-empty image_regex"
  }
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name"
}

variable "network_ids" {
  type        = list(string)
  description = "Network IDs to attach"
  validation {
    condition     = length(var.network_ids) > 0
    error_message = "At least one network_id must be provided"
  }
}

variable "tags" {
  type        = list(string)
  description = "Tags to apply"
  default     = []
}
