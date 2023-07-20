variable "azurerm_vpn_gateway_name" {
  type        = string
  description = "The name of the vpn gateway."
}
variable "location" {
  type        = string
  description = "The vpn location."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the subnet."
}
variable "virtual_hub_id" {
  type        = string
  description = "The hub id."
}