variable "azurerm_virtual_wan_name" {
  type        = string
  description = "The name of the WAN"
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the WAN"
}
variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}
variable "type" {
  type        = string
  description = "The name of the Subnet."
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
}