variable "KvName" {
  description = "KvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "KvRgName" {
  description = "KvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "Transitvnet" {
  description = "virtualNetwork"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "TransitvnetRG" {
  description = "virtualNetworkRG"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "Remotevnet" {
  description = "virtualNetwork"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "RemotevnetRG" {
  description = "virtualNetworkRG"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

########################## Vnet Peering ############################

variable "vnet_peering" {
  description = "Vnet Peering to multiple subscription Vnet"
  type        = map(any)
  default     = {}
}

variable "AllowVirtualNetworkAccess" {
  description = "AllowVirtualNetworkAccess"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AllowForwardedTraffic" {
  description = "AllowForwardedTraffic"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AllowGatewayTransitVNet12" {
  description = "AllowGatewayTransitVNet12"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AllowGatewayTransitVNet21" {
  description = "AllowGatewayTransitVNet21"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "UseRemoteGateways" {
  description = "UseRemoteGateways"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

###########################################################################################################################
