#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#apex key vault
variable "apexKvName" {
  description = "apexKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexRgName" {
  description = "apexRgName"
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

################ Private endpoint ##################

# variable "laEndPointName" {
#   description = "Private endpoint Name "
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "saEndPointName" {
#   description = "Private endpoint Name "
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "endPointLocation" {
#   description = "Private endpoint location "
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "resourceGroupName" {
#   description = "Resource Group name where private endpoints to be created"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "subnetId" {
#   description = "Subnet ID where private endpoints to be created"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "azMonitorPrivateLinkScopeId" {
#   description = "Azure Monitory Private Link Scope ID where private endpoints to be connected"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "saAzMonitorPrivateLinkScopeId" {
#   description = "Azure Monitory Private Link Scope ID where private endpoints to be connected"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "laSubResourceName" {
#   description = "Subresoruce name e.g. AzureMonitor"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "saSubResourceName" {
#   description = "Subresoruce name e.g. AzureMonitor"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "laPrivateServiceConnName" {
#   description = "Private Serviec connection Name"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "saPrivateServiceConnName" {
#   description = "Private Serviec connection Name"
#   default     = ".tmp" //intentionally kept it to something unrealistic
#   type        = string
# }
################# NSG Diag Settings ###########

variable "category1" {
  default = "null"
  type    = string
}
variable "category2" {
  default = "null"
  type    = string
}

variable "category1enabled" {
  default = null
  type    = bool
}
variable "retention_policy" {
  default = null
  type    = bool
}
variable "retention_policydays" {
  default = null
  type    = number
}
# variable "diagnostic_log" {
#   default = []
#   type    = list(any)
# }

variable "apex_nsg_name" {
  default = ""
  type    = string
}

variable "nsg_rg_name" {
  default = ""
  type    = string
}

variable "pep_nsg_name" {
  default = ""
  type    = string
}

variable "datagw_nsg_name" {
  default = ""
  type    = string
}

variable "dvweb_nsg_name" {
  default = ""
  type    = string
}
variable "dvapp_nsg_name" {
  default = ""
  type    = string
}

variable "diag_vnet_name" {
  default = ""
  type    = string
}

variable "diag_vnet_rg" {
  default = ""
  type    = string
}

variable "category3" {
  default = ""
  type    = string
}

variable "category4" {
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
