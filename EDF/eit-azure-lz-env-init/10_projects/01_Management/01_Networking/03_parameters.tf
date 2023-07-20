#environment
variable "environment" {
  description = "environment"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#mgmtss key vault
variable "managementHsKvName" {
  description = "managementHsKvName"
  type        = string
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managementHsKvRgName" {
  description = "managementHsKvRgName"
  type        = string
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
/*variable "diagnostic_log" {
  default = []
  type    = list(any)
}*/

variable "imagebuilder_nsg_name" {
  default = ""
  type    = string
}

variable "ado_nsg_name" {
  default = ""
  type    = string
}

variable "afs_nsg_name" {
  default = ""
  type    = string
}

/*variable "snow01_nsg_name" {
  default = ""
  type = string
}
variable "snow02_nsg_name" {
  default = ""
  type    = string
}*/

variable "adds_nsg_name" {
  default = ""
  type    = string
}

variable "audit_nsg_name" {
  default = ""
  type    = string
}

variable "ca_nsg_name" {
  default = ""
  type    = string
}

variable "mgmt_nsg_name" {
  default = ""
  type    = string
}

variable "wac_nsg_name" {
  default = ""
  type    = string
}

variable "wsus_nsg_name" {
  default = ""
  type    = string
}

variable "pep_nsg_name" {
  default = ""
  type    = string
}

variable "nsg_rg_name" {
  default = ""
  type    = string
}

########## Existing code #############
# #environment
# variable "environment" {
#   description = "environment"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }

# #managementHs key vault
# variable "managementHsKvName" {
#   description = "managementHsKvName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "managementHsKvRgName" {
#   description = "managementHsKvRgName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "t2fwIlbIp" {
#   description = "t2fwIlbIp"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }

# #managementHs resource group
# variable "lzmanagementHsNetworkingRgName" {
#   description = "lz hub resource group name"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# #managementHs networking
# variable "lzmanagementHsNetworkingResourceLocation" {
#   description = "hub networking resource location"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }

# variable "lzmanagementHsVnetName" {
#   description = "lz hub vnet name"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "managementHsSubnets" {
#   default = [
#     {
#       subnetName = "tmpName1" //intentionally kept it to something unrealistic
#       newBits    = 1
#       netNum     = 1
#     },
#     {
#       subnetName = "tmpName2" //intentionally kept it to something unrealistic
#       newBits    = 2
#       netNum     = 2
#     }
#   ]
# }

# ##############################
# variable "managementSubnetName" {
#   description = "managementSubnetName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "addsSubnetName" {
#   description = "addsSubnetName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "wsusSubnetName" {
#   description = "wsusSubnetName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "wacSubnetName" {
#   description = "wacSubnetName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "caSubnetName" {
#   description = "caSubnetName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "auditSubnetName" {
#   description = "auditSubnetName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }

# # Route Tables
# variable "mgmtRouteTableName" {
#   description = "mgmtRouteTableName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "mgmtRouteNames" {
#   description = "mgmtRouteNames"
#   type = list(string)
# }
# variable "mgmtNextHopTypes" {
#   description = "mgmtNextHopTypes"
#   type = list(string)
# }

# variable "adRouteTableName" {
#   description = "adRouteTableName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "adRouteNames" {
#   description = "adRouteNames"
#   type = list(string)
# }
# variable "adNextHopTypes" {
#   description = "adNextHopTypes"
#   type = list(string)
# }

# variable "wsusRouteTableName" {
#   description = "wsusRouteTableName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "wsusRouteNames" {
#   description = "wsusRouteNames"
#   type = list(string)
# }
# variable "wsusNextHopTypes" {
#   description = "wsusNextHopTypes"
#   type = list(string)
# }

# variable "wacRouteTableName" {
#   description = "wacRouteTableName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "wacRouteNames" {
#   description = "wacRouteNames"
#   type = list(string)
# }
# variable "wacNextHopTypes" {
#   description = "wacNextHopTypes"
#   type = list(string)
# }

# variable "pkiRouteTableName" {
#   description = "pkiRouteTableName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "pkiRouteNames" {
#   description = "pkiRouteNames"
#   type = list(string)
# }
# variable "pkiNextHopTypes" {
#   description = "pkiNextHopTypes"
#   type = list(string)
# }


# variable "auditRouteTableName" {
#   description = "auditRouteTableName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }
# variable "auditRouteNames" {
#   description = "auditRouteNames"
#   type = list(string)
# }
# variable "auditNextHopTypes" {
#   description = "auditNextHopTypes"
#   type = list(string)
# }

# ############# NSGs #################
# variable "addsNsgName" {
#   description = "addsNsgName"
#   default     = "eit-uks-alz-hs-adds-nsg-01" //should be static across envs
# }

# variable "wsusNsgName" {
#   description = "wsusNsgName"
#   default     = "eit-alz-hs-wsus-snet-01" //should be static across envs
# }

# variable "wacNsgName" {
#   description = "wacNsgName"
#   default     = "eit-uks-alz-hs-wac-nsg-01" //should be static across envs
# }

# variable "caNsgName" {
#   description = "caNsgName"
#   default     = "eit-uks-alz-hs-ca-nsg-01" //should be static across envs
# }

# variable "auditNsgName" {
#   description = "auditNsgName"
#   default     = "eit-uks-alz-hs-audit-nsg-01" //should be static across envs
# }
