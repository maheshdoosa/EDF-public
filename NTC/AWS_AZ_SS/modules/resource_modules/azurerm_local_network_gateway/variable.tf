variable "name" {
  type        = string
  description = "The name of the Virtual Network Gateway."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Virtual Network Gateway."
}
variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}
variable "gateway_address" {
  type        = string
  description = "The address prefixes to use for the Subnet."
}
variable "address_space" {
   type        = list(string)
  description = "The address space that is used in the Virtual Network. You can supply multiple."
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
}