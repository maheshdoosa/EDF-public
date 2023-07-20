#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#appSS key vault
variable "appSSKvName" {
  description = "appSSKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "appSSKvRgName" {
  description = "appSSKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "UDR" {
  description = "UDR to multiple Subnets"
  type        = map(any)
  default     = {}
}

variable "vnets" {
  type    = map(any)
  default = {}
}

variable "rgs" {
  type    = map(any)
  default = {}
}

variable "UDR_Subnet_Mapping" {
  type    = map(any)
  default = {}
}

################# VNET Peering Variables ###############

variable "vnet_peering" {
  description = "Vnet Peering to multiple subscription Vnet"
  type        = map(any)
  default     = {}
}

variable "tenantId" {
  description = "tenantId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "spokeSubscriptionId" {
  description = "spokeSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "hubSubscriptionId" {
  description = "hubSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowVirtualNetworkAccess" {
  description = "AllowVirtualNetworkAccess"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowForwardedTraffic" {
  description = "AllowForwardedTraffic"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowGatewayTransitVNet12" {
  description = "AllowGatewayTransitVNet12"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowGatewayTransitVNet21" {
  description = "AllowGatewayTransitVNet21"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "UseRemoteGateways" {
  description = "UseRemoteGateways"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "ciSubscriptionId" {
  description = "ciSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}
##### NSGs ################################
variable "nsg" {
  type        = map(any)
  description = "Key-Vaule Pairs. Key is NSG name and Value is a map of NSG details"
  default     = {}
}

variable "nsgrules" {
  type        = map(any)
  description = "Key-Value Pairs. Key is NSG name and Value is a list of rules for that NSG"
  default     = {}
}

variable "nsg_subnet_mapping" {
  type        = map(any)
  description = "Key-Value Pairs. Key is NSG name and Value is a map of subnets to associate"
  default     = {}
}

variable "asg_rg" {
  type        = map(any)
  description = "Key-Vaule Pairs. Key is ASG name and Value is a map of RG details"
  default     = {}
}
