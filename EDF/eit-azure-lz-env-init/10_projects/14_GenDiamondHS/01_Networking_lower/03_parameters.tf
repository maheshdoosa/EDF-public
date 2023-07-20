#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#gendiamondhs key vault
variable "gendiamondhsKvName" {
  description = "gendiamondhsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "gendiamondhsKvRgName" {
  description = "gendiamondhsKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
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
  type        = string
}
variable "spokeSubscriptionId" {
  description = "spokeSubscriptionId"
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
# ##### NSGs ################################
# variable "nsg" {
#   type        = map(any)
#   description = "Key-Vaule Pairs. Key is NSG name and Value is a map of NSG details"
#   default     = {}
# }
# variable "nsgrules" {
#   type        = map(any)
#   description = "Key-Value Pairs. Key is NSG name and Value is a list of rules for that NSG"
#   default     = {}
# }
# variable "nsg_subnet_mapping" {
#   type        = map(any)
#   description = "Key-Value Pairs. Key is NSG name and Value is a map of subnets to associate"
#   default     = {}
# }
# variable "asg_rg" {
#   type        = map(any)
#   description = "Key-Vaule Pairs. Key is ASG name and Value is a map of RG details"
#   default     = {}
# }

################# Diag Settings ###########

variable "category1" {
  default = "null"
  type    = string
}

variable "category2" {
  default = "null"
  type    = string
}

variable "retention_policydays" {
  default = null
  type    = number
}

# variable "diagnostic_log" {
#   default = []
#   type    = list(any)
# }

variable "diag_vnet_name01" {
  default = ""
  type    = string
}

variable "diag_vnet_rg01" {
  default = ""
  type    = string
}

variable "diag_vnet_name02" {
  default = ""
  type    = string
}

variable "diag_vnet_rg02" {
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
#######
variable "subnetName" {
  description = "subnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "vnetRgName" {
  description = "vnetRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "bastionvnetName" {
  description = "bastionvnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
