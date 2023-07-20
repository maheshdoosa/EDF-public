variable "name" {
  type        = string
  description = "The name of the Virtual Network."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Virtual Network and DDoS Plan (if enabled)."
}
variable "address_space" {
  type        = list(string)
  description = "The address space that is used in the Virtual Network. You can supply multiple."
}
variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}
variable "dns_servers" {
  description = "Azure Network DNS addresses. If no values are specified this will default to Azure DNS."
  type        = list(string)
  default     = null
}
variable "is_ddos_enabled" {
  type        = bool
  description = "Enable/disable DDoS Protection Plan on the VNET. This will also create a DDoS Plan if enabled."
  default     = false
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
}
variable "separator" {
  type        = string
  description = "The separator character to use in the name of the ddos protection plan, if enabled."
  default     = "-"
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