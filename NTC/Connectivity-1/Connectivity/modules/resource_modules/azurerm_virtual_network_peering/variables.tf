variable "spoke_virtual_network_resource_group_name" {
    type        = string
    description = "spoke virtual network resource group name"
}
variable "spoke_virtual_network_name" {
    type        = string
    description = "spoke virtual network name"
}
variable "hub_virtual_network_name" {
    type        = string
    description = "hub virtual network name"
}
variable "hub_virtual_network_resource_group_name" {
    type        = string
    description = "hub virtual network resource group name"
}
variable "hub_subscription_id" {
    type        = string
    description = "hub subscription ID"   
}
variable "allow_forwarded_traffic" {
    type        = string
}
variable "allow_gateway_transit" {
    type        = string
}
variable "allow_virtual_network_access" {
    type        = string 
}