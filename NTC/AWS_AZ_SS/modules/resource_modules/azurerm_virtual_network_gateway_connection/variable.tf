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
variable "connection_type" {
  type        = string
  description = "The virtual network gateway connection type."
}
variable "connection_mode" {
  type        = string
  description = "The Connection mode to use. Possible values are Default, InitiatorOnly and ResponderOnly. Defaults to Default."
}
variable "virtual_network_gateway_id" {
  type        = string
  description = "The virtual network gateway id."
}
variable "local_network_gateway_id" {
  type        = string
  description = "The local network gateway id."
}
variable "shared_key" {
  type        = string
  description = "The key for connection."
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
}