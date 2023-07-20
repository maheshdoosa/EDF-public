#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#WVD key vault
variable "wvdKvName" {
  description = "wvdKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "wvdKvRgName" {
  description = "wvdKvRgName"
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
