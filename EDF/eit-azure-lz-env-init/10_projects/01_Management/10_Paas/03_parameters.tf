variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#managementHs key vault
variable "managementHsKvName" {
  description = "managementHsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "managementHsKvRgName" {
  description = "managementHsKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

#paas resource group
variable "lzmanagementHsVmLogsRgName" {
  description = "lzmanagementHsVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsSubLogsRgName" {
  description = "lzmanagementHsSubLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsAuxScriptsRgName" {
  description = "lzmanagementHsAuxScriptsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

#managementHs paas location
variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#storage accounts
variable "vmDiagSA" {
  description = "vmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA" {
  description = "subLogsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSAImmutabilityRententionPeriod" {
  description = "subLogsSAImmutabilityRententionPeriod"
  type        = number
  default     = 1
}
variable "auxScriptsSA" {
  description = "auxScriptsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

######## AFS data sources secrets ################

variable "lzmanagementHsAFSSaName" {
  description = "lzmanagementHsAFSSaName"
  default     = ".tmp-loc"
  type        = string
}

variable "lzmanagementHsAFSFileShare" {
  description = "lzmanagementHsAFSFileShare"
  default     = ".tmp-loc"
  type        = string
}

variable "lzmanagementHsAFSSaSyncName" {
  description = "lzmanagementHsAFSSaSyncName"
  default     = ".tmp-loc"
  type        = string
}

variable "lzmanagementHsAFSVmRgName" {
  description = "AFS Vm RG Name"
  default     = ".tmp-loc"
  type        = string
}

variable "account_tier" {
  description = "Storage Account tier (Standard or Premium)"
  default     = ".tmp-sa"
  type        = string
}

variable "storagetype" {
  description = "Storage Account Type (StorageV2,Fileshare,etc..)"
  default     = ".tmp-sa"
  type        = string
}

variable "account_replication_type" {
  description = "Storage Account replication type"
  default     = ".tmp-sa"
  type        = string
}

variable "minTlsVersion" {
  description = "minTlsVersion"
  default     = ".tmp-sa"
  type        = string
}

variable "access_tier" {
  description = "Storage Account Access tier (Hot or Cold)"
  default     = ".tmp-sa"
  type        = string
}

variable "enable_https_traffic" {
  description = "enable_https_traffic for Stoarage Account"
  default     = ".tmp-sa"
  type        = string
}

variable "blob_public_access" {
  description = "enable_blob_public_access for Stoarage Account"
  default     = ".tmp-sa"
  type        = string
}

variable "hns_enabled" {
  description = "enable_hns_enabled file share"
  default     = ".tmp-sa"
  type        = string
}

variable "nfsv3_enabled" {
  description = "nfsv3_enabled"
  default     = ".tmp-sa"
  type        = string
}

variable "large_file_share" {
  description = " enable large_file_share"
  default     = ".tmp-sa"
  type        = string
}

variable "blob_soft_delete_retention_days" {
  description = "Storage Account blob_soft_delete_retention_days"
  default     = ".tmp-sa"
  type        = string
}

variable "container_delete_retention_policy_days" {
  description = "Container blob_soft_delete_retention_days"
  default     = ".tmp-sa"
  type        = string
}

variable "share_soft_delete_retention_days" {
  description = "Share share_soft_delete_retention_days"
  default     = ".tmp-sa"
  type        = string
}

variable "network_acl_action" {
  description = "Storage Account network_acl_action"
  default     = ".tmp-sa"
  type        = string
}

variable "microsoft_trusted_services" {
  description = "Storage Account routing_preference (microsoft_trusted_services)"
  default     = [".tmp-sa"]
  type        = list(string)
}

variable "routing_preference" {
  description = "Storage Account routing_preference (microsoft_trusted_services)"
  default     = ".tmp-sa"
  type        = string
}

variable "publish_internet_endpoints" {
  description = "Storage Account routing publish_internet_endpoints"
  default     = ".tmp-sa"
  type        = string
}

variable "publish_microsoft_endpoints" {
  description = "Storage Account routing_publish_microsoft_endpoints"
  default     = ".tmp-sa"
  type        = string
}

variable "fileshare_quota" {
  description = "Storage Account fileshare_quota"
  default     = ".tmp-sa"
  type        = string
}

variable "lzmanagementHsAFSPrivateEndpoint" {
  description = "lzmanagementSsAFSPrivateEndpoint"
  default     = ".tmp-sa"
  type        = string
}
# variable "lzmanagementHsAuditSubnetName" {
#   description = "lzmanagementHsAuditSubnetName"
#   default     = ".tmp-sa"
#   type        = string
# }

# variable "lzmanagementHsVnetName" {
#   description = "lzmanagementHsVnetName"
#   default     = ".tmp-sa"
#   type        = string
# }

variable "lzmanagementHsAFSServiceConnection" {
  description = "lzmanagementHsAFSServiceConnection"
  default     = ".tmp-sa"
  type        = string
}

variable "lzmanagementHsAFSSubResourceName" {
  description = "lzmanagementHsAFSSubResourceName"
  default     = [".tmp-sa"]
  type        = list(string)
}

# variable "lzmanagementHsVnetRgName" {
#   description = "lzmanagementHsVnetRgName"
#   default     = ".tmp-rg"
#   type        = string
# }

# variable "lzmanagementHsAFSVnetName" {
#   description = "lzmanagementHsAFSVnetName"
#   default     = ".tmp-rg"
#   type        = string
# }



###### Image gallery  ######

variable "lzmanagementHSVmimageRgName" {
  description = "lzmanagementHSVmimageRgName"
  default     = ".tmp-loc"
  type        = string
}

variable "SIgalleryname" {
  type        = string
  description = "Name of the shared Image Gallery"
  default     = ""
}

variable "images" {
  description = "(Optional) sku of the resource"
  type = map(object({
    sharedimagename          = string,
    Sharedimagegalleryname   = string,
    sharedimageresourcegroup = string,
    sharedimagelocation      = string,
    os_type                  = string,
    publisher                = string,
    offer                    = string,
    sku                      = string,
    planpurchase             = string,
    planpublisher            = string,
    planproduct              = string,
    publisher                = string,
    publisher                = string,
  }))
}


######## AUX ADDS ##########

variable "mgmtaddssaRgName" {
  description = "mgmtaddssaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssaResourceLocation" {
  description = "mgmtaddssaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa" {
  description = "mgmtaddssa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_accounttier" {
  description = "mgmtaddssa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_storagetype" {
  description = "mgmtaddssa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_accountreptype" {
  description = "mgmtaddssa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_tlsversion" {
  description = "mgmtaddssa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_accesstier" {
  description = "mgmtaddssa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_httpstraffic" {
  description = "mgmtaddssa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_publicaccess" {
  description = "mgmtaddssa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_hnsenable" {
  description = "mgmtaddssa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_nfsv3" {
  description = "mgmtaddssa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_largefileshare" {
  description = "mgmtaddssa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_blobsoftdelete" {
  description = "mgmtaddssa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_containersoftdelete" {
  description = "mgmtaddssa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_sharesoftdelete" {
  description = "mgmtaddssa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_acl" {
  description = "mgmtaddssa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_bypass" {
  description = "mgmtaddssa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "mgmtaddssa_routing" {
  description = "mgmtaddssa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_publishinternet" {
  description = "mgmtaddssa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtaddssa_publishmicrosoft" {
  description = "mgmtaddssa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}



######## AUX NTC ##########

variable "mgmtntcsaRgName" {
  description = "mgmtntcsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsaResourceLocation" {
  description = "mgmtntcsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa" {
  description = "mgmtntcsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_accounttier" {
  description = "mgmtntcsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_storagetype" {
  description = "mgmtntcsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_accountreptype" {
  description = "mgmtntcsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_tlsversion" {
  description = "mgmtntcsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_accesstier" {
  description = "mgmtntcsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_httpstraffic" {
  description = "mgmtntcsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_publicaccess" {
  description = "mgmtntcsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_hnsenable" {
  description = "mgmtntcsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_nfsv3" {
  description = "mgmtntcsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_largefileshare" {
  description = "mgmtntcsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_blobsoftdelete" {
  description = "mgmtntcsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_containersoftdelete" {
  description = "mgmtntcsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_sharesoftdelete" {
  description = "mgmtntcsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_acl" {
  description = "mgmtntcsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_bypass" {
  description = "mgmtntcsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "mgmtntcsa_routing" {
  description = "mgmtntcsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_publishinternet" {
  description = "mgmtntcsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtntcsa_publishmicrosoft" {
  description = "mgmtntcsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


######## Storage account PE #############
variable "saprivate_dns_zone_name" {
  description = "saprivate_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtvmDiagHSsaRgName" {
  description = "mgmtvmDiagHSsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtvmDiagHSauxsa_endpoint_name" {
  description = "mgmtvmDiagHSauxsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtResourceLocation" {
  description = "mgmtResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtvmDiagHSauxsa_endpoint_SC" {
  description = "mgmtvmDiagHSauxsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtsa_subresource_names" {
  description = "mgmtsa_subresource_names"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "mgmtHSpesubnetName" {
  description = "mgmtHSpesubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSpeVnetName" {
  description = "mgmtHSpeVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSpeVnetRgName" {
  description = "mgmtHSpeVnetRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtsubLogsHSauxsa_endpoint_name" {
  description = "mgmtsubLogsHSauxsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtsubLogsHSauxsa_endpoint_SC" {
  description = "mgmtsubLogsHSauxsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSauxsa_endpoint_name" {
  description = "mgmtHSauxsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSauxsa_endpoint_SC" {
  description = "mgmtHSauxsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSaddssa_endpoint_name" {
  description = "mgmtHSaddssa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSaddssa_endpoint_SC" {
  description = "mgmtHSaddssa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSntcsa_endpoint_name" {
  description = "mgmtHSntcsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtHSntcsa_endpoint_SC" {
  description = "mgmtHSntcsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

######### RecoveryServiceVault ############

variable "resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "resourceLocation" {
  description = "resource location"
  default     = "" //intentionally kept it to something unrealistic
  type        = string
}

# variable "costcentre" {
#   description = "cost centre"
#   default     = "eit"
#   type        = string
# }

# variable "additionalTags" {
#   type        = map(string)
#   description = "Additional tags to be enforced"
#   default     = {}
# }

variable "vm_backup_policy_timezone" {
  description = "Specifies the timezone for VM backup schedules. Defaults to `UTC`."
  type        = string
  default     = "UTC"
}

variable "sku" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = "Standard"
}

variable "storage_mode_type" {
  description = "(Optional) storage mode "
  type        = string
  default     = "GeoRedundant"
}

variable "soft_delete_enabled" {
  description = "(Optional) soft delete enabled of the resource"
  type        = bool
  default     = true
}

# variable "rsvname" {
#   description = "(Required) You can use a prefix to add to the list of resource groups you want to create"
#   default     = ""
#   type        = string
# }

variable "recovery_vault_name" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "recovery_vault_name_02" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}
# variable "log_analytics_workspace_name" {
#   description = "Log Analytics Workspace Name"
#   default     = ""
#   type        = string
# }

# variable "log_analytics_workspace_id" {
#   description = "Log Analytics Workspace ID where the logs are sent"
#   type        = string
#   default     = null
# }

# variable "recovery_services_vault_id" {
#   description = "recovery_services_vault id"
#   type        = string
#   default     = null
# }

# variable "log_category" {
#   description = "log category"
#   default     = ""
#   type        = string
# }

# variable "log_category_enabled" {
#   description = "log category"
#   type        = string
#   default     = ""
# }

# variable "log_category_retention" {
#   description = "log category"
#   type        = string
#   default     = ""
# }

# variable "log_category_retention_days" {
#   description = "log category"
#   type        = string
#   default     = ""
# }

############# Backup Policy #############

# variable "backup_policy_id" {
#   description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
#   type        = string
#   default     = ""
# }

# variable "backup_policyId" {
#   description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
#   default     = ""
#   type        = string
# }

variable "infraVM_backup_policy" {
  description = "Name of the backup policy which will be applied"
  default     = ""
  type        = string
}

variable "backup_policy_time_02" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ""
  type        = string
}

variable "backup_policy_frequency" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "backup_policy_time" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_daily_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_weekly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_weekly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_monthly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_monthly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_monthly_weeks" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_yearly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_yearly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_yearly_weeks" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_yearly_months" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

###### VM Backup ######

# variable "source_vm_id" {
#   description = "vmId"
#   default     = {}
#   type        = map(any)
# }

# variable "resource_group_name" {
#   description = "resource group name"
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "vmName" {
#   description = "Name of the VM"
#   default     = {}
# }
variable "AFS_private_dns_zone_name" {
  description = "AFS_private_dns_zone_name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}
variable "mgmtPrivateDNSRgName" {
  description = "mgmtPrivateDNSRgName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}
############ avmeit Storage Account #######################

variable "avmeitRgName" {
  description = "avmeitRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeitResourceLocation" {
  description = "avmeitResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit" {
  description = "avmeit"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_accounttier" {
  description = "avmeit_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_storagetype" {
  description = "avmeit_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_accountreptype" {
  description = "avmeit_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_tlsversion" {
  description = "avmeit_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_accesstier" {
  description = "avmeit_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_httpstraffic" {
  description = "avmeit_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_publicaccess" {
  description = "avmeit_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_hnsenable" {
  description = "avmeit_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_nfsv3" {
  description = "avmeit_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_largefileshare" {
  description = "avmeit_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_acl" {
  description = "avmeit_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_bypass" {
  description = "avmeit_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "avmeit_routing" {
  description = "avmeit_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_publishinternet" {
  description = "avmeit_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_publishmicrosoft" {
  description = "avmeit_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "avmeitca" {
#   description = "avmeitca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
############ tfstate Storage Account #######################

variable "tfstateRgName" {
  description = "tfstateRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstateResourceLocation" {
  description = "tfstateResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate" {
  description = "tfstate"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_accounttier" {
  description = "tfstate_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_storagetype" {
  description = "tfstate_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_accountreptype" {
  description = "tfstate_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_tlsversion" {
  description = "tfstate_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_accesstier" {
  description = "tfstate_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_httpstraffic" {
  description = "tfstate_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_publicaccess" {
  description = "tfstate_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_hnsenable" {
  description = "tfstate_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_nfsv3" {
  description = "tfstate_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_largefileshare" {
  description = "tfstate_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_acl" {
  description = "tfstate_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_bypass" {
  description = "tfstate_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "tfstate_routing" {
  description = "tfstate_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_publishinternet" {
  description = "tfstate_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_publishmicrosoft" {
  description = "tfstate_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "tfstateca" {
#   description = "tfstateca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "avmeit_privateEndpoint_name" {
  description = "avmeit_privateEndpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmeit_privateEndpoint_sc" {
  description = "avmeit_privateEndpoint_sc"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_privateEndpoint_name" {
  description = "tfstate_privateEndpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "tfstate_privateEndpoint_sc" {
  description = "tfstate_privateEndpoint_sc"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
############ auditsa Storage Account #######################

variable "auditsaRgName" {
  description = "auditsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsaResourceLocation" {
  description = "auditsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa" {
  description = "auditsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_accounttier" {
  description = "auditsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_storagetype" {
  description = "auditsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_accountreptype" {
  description = "auditsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_tlsversion" {
  description = "auditsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_accesstier" {
  description = "auditsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_httpstraffic" {
  description = "auditsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_publicaccess" {
  description = "auditsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_hnsenable" {
  description = "auditsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_nfsv3" {
  description = "auditsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_largefileshare" {
  description = "auditsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_acl" {
  description = "auditsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_bypass" {
  description = "auditsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "auditsa_routing" {
  description = "auditsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_publishinternet" {
  description = "auditsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_publishmicrosoft" {
  description = "auditsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "auditsaca" {
#   description = "auditsaca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "auditsa_blobsoftdelete" {
  description = "auditsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_containersoftdelete" {
  description = "auditsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auditsa_sharesoftdelete" {
  description = "auditsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
############ auxsa Storage Account #######################

variable "auxsaRgName" {
  description = "auxsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsaResourceLocation" {
  description = "auxsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa" {
  description = "auxsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_accounttier" {
  description = "auxsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_storagetype" {
  description = "auxsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_accountreptype" {
  description = "auxsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_tlsversion" {
  description = "auxsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_accesstier" {
  description = "auxsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_httpstraffic" {
  description = "auxsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_publicaccess" {
  description = "auxsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_hnsenable" {
  description = "auxsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_nfsv3" {
  description = "auxsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_largefileshare" {
  description = "auxsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_acl" {
  description = "auxsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_bypass" {
  description = "auxsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "auxsa_routing" {
  description = "auxsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_publishinternet" {
  description = "auxsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_publishmicrosoft" {
  description = "auxsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "auxsaca" {
#   description = "auxsaca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "auxsa_blobsoftdelete" {
  description = "auxsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_containersoftdelete" {
  description = "auxsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_sharesoftdelete" {
  description = "auxsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
############ vmlogsa Storage Account #######################

variable "vmlogsaRgName" {
  description = "vmlogsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsaResourceLocation" {
  description = "vmlogsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa" {
  description = "vmlogsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_accounttier" {
  description = "vmlogsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_storagetype" {
  description = "vmlogsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_accountreptype" {
  description = "vmlogsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_tlsversion" {
  description = "vmlogsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_accesstier" {
  description = "vmlogsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_httpstraffic" {
  description = "vmlogsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_publicaccess" {
  description = "vmlogsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_hnsenable" {
  description = "vmlogsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_nfsv3" {
  description = "vmlogsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_largefileshare" {
  description = "vmlogsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_acl" {
  description = "vmlogsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_bypass" {
  description = "vmlogsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "vmlogsa_routing" {
  description = "vmlogsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_publishinternet" {
  description = "vmlogsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_publishmicrosoft" {
  description = "vmlogsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "vmlogsaca" {
#   description = "vmlogsaca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "vmlogsa_blobsoftdelete" {
  description = "vmlogsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_containersoftdelete" {
  description = "vmlogsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogsa_sharesoftdelete" {
  description = "vmlogsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "container" {
  description = "container"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "EITDevopsAppRgName" {
  description = "EITDevopsAppRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "EITDevopsPackerRgName" {
  description = "EITDevopsPackerRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "EITDevopsctrlplaneRgName" {
  description = "EITDevopsctrlplaneRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "eitdevopsResourceLocation" {
  description = "eitdevopsResourceLocation"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "category1" {
  default = "null"
  type    = string
}
variable "category2" {
  default = "null"
  type    = string
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
variable "category6" {
  default = "null"
  type    = string
}
variable "category7" {
  default = "null"
  type    = string
}
variable "category8" {
  default = "null"
  type    = string
}
variable "category9" {
  default = "null"
  type    = string
}
variable "category10" {
  default = "null"
  type    = string
}
variable "category11" {
  default = "null"
  type    = string
}
variable "category12" {
  default = "null"
  type    = string
}
variable "category13" {
  default = "null"
  type    = string
}
variable "category14" {
  default = "null"
  type    = string
}
variable "category15" {
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
######### Storage account diag settings #######
variable "category16" {
  default = "null"
  type    = string
}
variable "category17" {
  default = "null"
  type    = string
}
variable "category18" {
  default = "null"
  type    = string
}
variable "category19" {
  default = "null"
  type    = string
}
