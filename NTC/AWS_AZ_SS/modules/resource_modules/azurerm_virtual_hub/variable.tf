variable "azurerm_virtual_hub_name" {
  type        = string
  description = "The name of the Subnet."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Virtual hub."
}
variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}
variable "virtual_wan_id" {
  type        = string
  description = "The ID of the WAN where thi hub need to be created."
}
variable "address_prefixes" {
   type        = string
  description = "The address space that is used in the Virtual Network. You can supply multiple."
}
variable "virtual_hub_sku" {
   type        = string
  description = "The address space that is used in the Virtual Network. You can supply multiple."
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
}