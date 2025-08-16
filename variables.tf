variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key"
  sensitive   = true
  validation {
    condition     = length(var.ibmcloud_api_key) > 0
    error_message = "IBM Cloud API key must not be empty."
  }
}

variable "region" {
  type        = string
  description = "IBM Cloud region"
  validation {
    condition     = length(var.region) > 0
    error_message = "Region must not be empty."
  }
}

variable "zone" {
  type        = string
  description = "PowerVS zone"
  validation {
    condition     = length(var.zone) > 0
    error_message = "Zone must not be empty."
  }
}

variable "powervs_service_instance_id" {
  type        = string
  description = "PowerVS service instance identifier"
  validation {
    condition     = length(var.powervs_service_instance_id) > 0
    error_message = "Service instance ID must not be empty."
  }
}

variable "resource_group" {
  type        = string
  description = "Resource group name"
  default     = "powervs-lab"
}

variable "ssh_key_name" {
  type        = string
  description = "Existing SSH key name in the PowerVS workspace"
  validation {
    condition     = length(var.ssh_key_name) > 0
    error_message = "SSH key name must not be empty."
  }
}

variable "aix_image_name" {
  type        = string
  description = "AIX image name"
  default     = "AIX 7.3 TLx"
}

variable "linux_image_name" {
  type        = string
  description = "Linux image name"
  default     = "RHEL 9 for Power"
}

variable "aix_profile" {
  type        = string
  description = "AIX instance profile (processors x memory in GB)"
  default     = "bx2-4x16"
}

variable "linux_profile" {
  type        = string
  description = "Linux instance profile (processors x memory in GB)"
  default     = "bx2-4x16"
}

variable "owner" {
  type        = string
  description = "Owner tag"
  default     = "unknown"
}

variable "environment" {
  type        = string
  description = "Environment tag"
  default     = "dev"
}
