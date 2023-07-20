variable "name" {
  type        = string
  description = "The name of the Network Security Group."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Network Security Group."
}
variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}
variable "tags" {
  type        = map(string)
  description = "Aa mapping of tags to assign to the resource."
}
variable "nsg_rules" {
  type = list(object({
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_ranges           = list(string)
    destination_port_ranges      = list(string)
    source_address_prefixes      = list(string)
    destination_address_prefixes = list(string)
  }))
  description = "List of object representing NSG rules."
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