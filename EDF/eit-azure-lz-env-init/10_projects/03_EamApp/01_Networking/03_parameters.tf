#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#EAM App key vaultdefault     = ".tmp-loc" //intentionally kept it to something unrealistic
variable "eamAppKvName" {
  description = "eamAppKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "eamAppKvRgName" {
  description = "eamAppKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

## Peering Variables

variable "vnet_peering" {
  description = "Vnet Peering to multiple subscription Vnet"
  type        = map(any)
  default     = {}
}

variable "tenantId" {
  description = "tenantId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "spokeSubscriptionId" {
  description = "spokeSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ciSubscriptionId" {
  description = "ciSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "hubSubscriptionId" {
  description = "hubSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
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

############################################################
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

################# Diag Settings ###########
variable "retention_policydays" {
  default = null
  type    = number
}

# variable "diagnostic_log" {
#   default = []
#   type    = list(any)
# }

variable "diag_vnet_name" {
  default = ""
  type    = string
}

variable "diag_vnet_rg" {
  default = ""
  type    = string
}

variable "category1" {
  default = ""
  type    = string
}

variable "category2" {
  default = ""
  type    = string
}

variable "category_enabled" {
  default = null
  type    = bool
}

variable "category_disabled" {
  default = null
  type    = bool
}

variable "retention_policy_enabled" {
  default = null
  type    = bool
}

variable "retention_policy_disabled" {
  default = null
  type    = bool
}
