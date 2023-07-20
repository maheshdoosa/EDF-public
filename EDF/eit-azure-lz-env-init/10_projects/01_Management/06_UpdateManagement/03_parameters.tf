/*variable "environment" {
  description = "environment"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
*/
#managementHs key vault
variable "managementHsKvName" {
  description = "managementHsKvName"
  type        = string
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

/*variable "managementHsKvRgName" {
  description = "managementHsKvRgName"
  type        = string
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}*/

#wsus Resource Group Name
variable "wsusRgName" {
  description = "wsusRgName"
  type        = string
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#wsus Resource group location
variable "wsusLocation" {
  description = "wsusLocation"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#wsus Networking
variable "wsusSubnetName" {
  description = "wsusSubnetName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "lzmanagementHsVnetName" {
  description = "lzmanagementHsVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsNetworkingRgName" {
  description = "lzmanagementHsNetworkingRgName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "ouPath" {
  description = "ouPath"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealis
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageRgName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealis
}

variable "storageAccountName" {
  description = "storageAccountName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
/*variable "saContainerName" {
  description = "saContainerName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}*/

#############
variable "lapsFilePath" {
  description = "lapsFilePath"
  type        = string
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}
variable "gbRegionXmlFilePath" {
  description = "script file path"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "prepVmPs1FilePath" {
  description = "PS1 script file path"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  type        = string
  default     = ""
}

###################### LA and AAC parameters #############
variable "updateManagmentRgName" {
  description = "updateManagmentRgName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "updateManagmentRgLocation" {
  description = "updateManagmentRgLocation"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "laWorkspacename" {
  description = "laWorkspacename"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "automationAccountName" {
  description = "automationAccountName"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "automationAccountSku" {
  description = "automationAccountSku"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic

}
/*variable "laWorkspaceSku" {
  description = "laWorkspaceSku"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic

}*/
variable "lawSolutionName" {
  description = "laWorkspaceSku"
  type        = string
  default     = ".tmp-loc" //intentionally kept it to something unrealistic

}
variable "amplsName" {
  description = "amplsName"
  type        = string
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}
################# Private endpoint ##################
variable "laEndPointName" {
  description = "Private endpoint Name "
  type        = string
  default     = ".tmp" //intentionally kept it to something unrealistic
}
variable "aacEndPointName" {
  description = "Private endpoint Name "
  type        = string
  default     = ".tmp" //intentionally kept it to something unrealistic
}
variable "laSubResourceName" {
  description = "Subresoruce name e.g. AzureMonitor"
  type        = list(string)
  default     = [".tmp"] //intentionally kept it to something unrealistic
}
/*variable "aacSubResourceName" {
  description = "Subresoruce name e.g. AzureMonitor"
  type        = string
  default     = ".tmp" //intentionally kept it to something unrealistic
}*/
variable "laPrivateServiceConnName" {
  description = "Private Serviec connection Name"
  type        = string
  default     = ".tmp" //intentionally kept it to something unrealistic
}
# variable "aacPrivateServiceConnName" {
#   description = "Private Serviec connection Name"
#   type        = string
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }
################
# variable "automationAccountMsiTemplate" {
#   description = "automation account system assigned managed identity template"
#   type        = string
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
# }

##########
variable "identityType" {
  description = "automation account system assigned managed identity"
  type        = string
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}
###########
variable "category1" {
  type    = string
  default = "null"
}
variable "category2" {
  type    = string
  default = "null"
}
variable "category3" {
  default = "null"
  type    = string
}
variable "category4" {
  default = "null"
  type    = string
}
variable "category5" {
  default = "null"
  type    = string
}
variable "categoryenabledtrue" {
  default = null
  type    = bool
}
variable "categoryenabledfalse" {
  default = null
  type    = bool
}

variable "retention_policy_enabled_true" {
  default = null
  type    = bool
}
variable "retention_policy_enabled_false" {
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

#########Creating private endpoint and privite DNS zone for Automation Account ########

variable "private_dns_zone_name" {
  type        = string
  description = "The name of Privite dns name"
  default     = ""
}

# variable "private_dns_zone_group" {
#   type        = string
#   description = "The name of Privite dns group name"
#   default     = ""
# }
variable "endpoint_SC" {
  description = "privite end point name Service connection name"
  default     = ""
  type        = string
}

# variable "subnet_id" {
#   description = "subnet id"
#   default     = ""
#   type        = string
# }

# variable "private_connection_resource_id" {
#   description = "Privite Connection resource id(keyvault/storage/sql)"
#   default     = ""
#   type        = string
# }

variable "is_manual_connection" {
  description = "If you are trying to connect the Private Endpoint to a remote resource without having the correct RBAC permissions on the remote resource set this value to true"
  default     = ""
  type        = string
}

variable "subresource_names" {
  description = "A list of subresource names which the Private Endpoint is able to connect"
  default     = [""]
  type        = list(string)
}

# variable "private_dns_zone_ids" {
#   type        = list(string)
#   description = "The name of an private DNS Zone"
#   default     = [""]
# }

# variable "lzsandpitNetworkingRgName" {
#   description = "Vnet Rg Name"
#   default     = ""
#   type        = string
# }

# variable "lzsandpitVnetName" {
#   description = "Vnet Name"
#   default     = ""
#   type        = string
# }

# variable "peSubnetName" {
#   description = "subnet name"
#   default     = ""
#   type        = string
# }

# variable "aad_group" {
#   description = "AAD Groups Name"
#   default     = ""
#   type        = string
# }

# variable "aad_user" {
#   description = "AAD users Name"
#   default     = ""
#   type        = string
# }
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
