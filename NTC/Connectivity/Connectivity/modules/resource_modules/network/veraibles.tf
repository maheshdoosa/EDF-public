variable "resource_group_name" {
    description = "The name of the Resource Group."
}
variable "location" { 
    description = "The name of region where the resources will be created"
}
variable "virtual_networks" {
    description = "The virtual networks that will be created."
}
variable "subnets" {
    description = "The subnets that will be created."
}
variable "route_tables" {
    description = "The route tables that will be created."
}
variable "nsgs" {
    description = "The nsetwork security groups that will be created."
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
}

# ==================== #
# LOG ANALYTICS 
# ==================== #
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