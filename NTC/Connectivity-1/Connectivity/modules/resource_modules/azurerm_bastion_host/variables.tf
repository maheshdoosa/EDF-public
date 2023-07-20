variable "name" {
  type        = string
  description = "The name of the Bastion Host."
}

variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Linux VM."
}

variable "sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the bastion host"
}

variable "copy_paste_enabled" {
  type        = bool
  description = "Is Copy/Paste feature enabled for the Bastion Host."
}

variable "file_copy_enabled" {
  type        = bool
  description = "Is File Copy feature enabled for the Bastion Host."
}

variable "ip_connect_enabled" {
  type        = bool
  description = "Is IP Connect feature enabled for the Bastion Host."
}

variable "scale_units" {
  type        = number
  description = "The number of scale units with which to provision the Bastion Host. Possible values are between 2 and 50. Defaults to 2"
  default     = 2
}

variable "shareable_link_enabled" {
  type        = bool
  description = "Is Shareable Link feature enabled for the Bastion Host."
  default     = false
}

variable "tunneling_enabled" {
  type        = bool
  description = "Is Tunneling feature enabled for the Bastion Host. Defaults to false."
  default     = null
}

variable "ip_configuration_name" {
  type = string
  description = "A name used for this IP Configuration."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located in."
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the Public IP where this Network Interface should be located in."
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags which should be assigned to this Virtual Machine."
  default     = null
}

# ==================== #
# LOG ANALYTICS 
# ==================== #
variable "monitor_diagnostic_settings_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_subscription_id" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}