#tags
# variable "businessUnit" {
#   description = "businessUnit"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "majorFunction" {
#   description = "majorFunction"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "costCentre" {
#   description = "costCentre"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "projectCode" {
#   description = "projectCode"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "category" {
#   description = "category"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "serviceLevel" {
#   description = "serviceLevel"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "owner" {
#   description = "owner"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "support" {
#   description = "support"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#Project CI key vault
variable "prjKvName" {
  description = "prjKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "prjKvRgName" {
  description = "prjKvRgName"
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
################## NSG's ########
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

################# Diag Settings ###########
variable "retention_policydays" {
  default = null
  type    = number
}

# variable "diagnostic_log" {
#   default = []
#   type    = list(any)
# }

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
