
variable "environment" {
  description = "environment"
  default     = ".tmp"
  type        = string
}
variable "managedGenHSKvName" {
  description = "Key vault name where keys and secrets are stored"
  default     = ".tmp"
  type        = string
}

variable "managedGenHSKvRgName" {
  description = "resoruce group of Key vault name where keys and secrets are stored"
  default     = ".tmp"
  type        = string
}


########### Apex Production PaaS Resource Parameters #####################################

###VMDiagSt

variable "ApexHSprdVmLogsRgName" {
  description = "ApexHSprdVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHSprdscriptsRgName" {
  description = "ApexHSprdscriptsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHSResourceLocation" {
  description = "ApexHSResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "prdvmDiagSA" {
  description = "prdvmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "prdscriptsSA" {
  description = "prdscriptsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "containers" {
#   type = map(object({
#     container_name = string
#   }))
#   description = "Azure Storage Account Containers"
#   default     = {}
# }

variable "vmDiagSA_tlsversion" {
  description = "minTlsVersion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_accounttier" {
  description = "Storage Account tier (Standard or Premium)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_storagetype" {
  description = "Storage Account Type (StorageV2,Fileshare,etc..)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_httpstraffic" {
  description = "enable_https_traffic for Stoarage Account"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_publicaccess" {
  description = "enable_blob_public_access for Stoarage Account"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_hnsenable" {
  description = "enable_hns_enabled file share"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_nfsv3" {
  description = "nfsv3_enabled"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_largefileshare" {
  description = " enable large_file_share"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_accountreptype" {
  description = "Storage Account replication type"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_accesstier" {
  description = "Storage Account Access tier (Hot or Cold)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_blobsoftdelete" {
  description = "Storage Account blob_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_containersoftdelete" {
  description = "Storage Account blob_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_sharesoftdelete" {
  description = "Storage Account share_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_acl" {
  description = "Storage Account network_acl_action"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_bypass" {
  description = "Allow trusted Microsoft Services to access this storage account "
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}

# variable "routing_preference" {
#   description = "Storage Account routing_preference (microsoft_trusted_services)"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "vmDiagSA_routing" {
  description = "Storage Account routing_preference (microsoft_trusted_services)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_publishinternet" {
  description = "Storage Account routing publish_internet_endpoints"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagSA_publishmicrosoft" {
  description = "Storage Account routing_publish_microsoft_endpoints"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


# variable "additionalTags" {
#   type        = map(string)
#   description = "Additional tags to be enforced"
#   default     = {}
# }

######### RecoveryServiceVault ############

variable "ApexHS_rsv_resourceGroupName" {
  description = "ApexHS_rsv_resourceGroupName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHS_recovery_vault_name" {
  description = "ApexHS_recovery_vault_name"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "sku" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = "Standard"
}

variable "soft_delete_enabled" {
  description = "(Optional) soft delete enabled of the resource"
  type        = bool
  default     = true
}


# variable "log_analytics_workspace_name" {
#   description = "log_analytics_workspace_name"
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "log_category" {
#   description = "log category"
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "log_category_enabled" {
#   description = "log category"
#   type        = string
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
# }

# variable "log_category_retention" {
#   description = "log category"
#   type        = string
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
# }

# variable "log_category_retention_days" {
#   description = "log category"
#   type        = string
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
# }

############# Backup Policy #############

variable "infraVM_backup_policy_01" {
  description = "Name of the backup policy which will be applied"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}
variable "vm_backup_policy_timezone" {
  description = "Specifies the timezone for VM backup schedules. Defaults to `UTC`."
  type        = string
  default     = "UTC"
}

variable "backup_policy_time_01" {
  description = "backup_policy_time_01"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "backup_policy_time_02" {
  description = "backup_policy_time_02"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}


variable "backup_policy_frequency" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "retention_daily_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "retention_weekly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "retention_weekly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_monthly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
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
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
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


################# KeyVault ##########################

variable "ApexHS_kv_resourceGroupName" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}

variable "ApexHS_keyvault_name" {
  description = "The name of keyvault "
  default     = ""
  type        = string
}


variable "sku_name" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}

variable "enabled_for_deployment" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}

variable "enabled_for_template_deployment" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

# variable "diagnosticsetting_name" {
#   type        = string
#   description = "The name of keyvault diagnostics settings name"
#   default     = ""
# }
# variable "access_policies" {
#   description = "Map of access policies for an object_id (user, service principal, security group) to backend."
#   type = list(object({
#     object_id               = string,
#     certificate_permissions = list(string),
#     key_permissions         = list(string),
#     secret_permissions      = list(string),
#     storage_permissions     = list(string),
#   }))
#   default = []
# }

#########Creating privite DNS zone for ApexHs ########

variable "ApexHSPrivateDNSRgName" {
  description = "ApexHSPrivateDNSRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "private_dns_zone_name" {
  description = "The name of Privite dns name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "vnet_dns_link_name" {
  description = "Vnet to Private DNS link name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

#########Creating privite endPoint Integration for MDWHs ########

variable "ApexHs_Prd_endpoint_name" {
  description = "Prod privite end point name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string

}

variable "ApexHs_Prd_endpoint_SC" {
  description = "Prod privite end point name Service connection name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "is_manual_connection" {
  description = "If you are trying to connect the Private Endpoint to a remote resource without having the correct RBAC permissions on the remote resource set this value to true"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "subresource_names" {
  description = "A list of subresource names which the Private Endpoint is able to connect"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}

# variable "private_dns_zone_ids" {
#   type        = list(string)
#   description = "The name of an private DNS Zone"
#   default     = [""]
# }

variable "ApexHsPrdNetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHsPrdVnetName" {
  description = "Vnet Name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "ApexHsPrdSubnetName" {
  description = "subnet name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

############## SA Private endpoint ###################
# variable "ApexHS_vmDiagSA_resourceGroupName" {
#   description = "ApexHS_vmDiagSA_resourceGroupName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "ApexHs_uat_vmDiagSA_endpoint_name" {
#   description = "ApexHs_uat_vmDiagSA_endpoint_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHs_uat_vmDiagSA_endpoint_SC" {
#   description = "ApexHs_uat_vmDiagSA_endpoint_SC"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHS_auxScriptsSA_resourceGroupName" {
#   description = "ApexHS_auxScriptsSA_resourceGroupName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHs_uat_auxScriptsSA_endpoint_name" {
#   description = "ApexHs_uat_auxScriptsSA_endpoint_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHs_uat_auxScriptsSA_endpoint_SC" {
#   description = "ApexHs_uat_auxScriptsSA_endpoint_SC"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHSvmlogssaPrivateDNSRgName" {
#   description = "ApexHSvmlogssaPrivateDNSRgName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "private_dns_zone_vmlogs_name" {
#   description = "private_dns_zone_vmlogs_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "vnet_dns_link_vmlogs_name" {
#   description = "vnet_dns_link_vmlogs_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "ApexHS_vmlogssa_resourceGroupName" {
#   description = "ApexHS_vmlogssa_resourceGroupName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "ApexHs_uat_vmlogssa_endpoint_name" {
#   description = "ApexHs_uat_vmlogssa_endpoint_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHs_Prd_endpoint_vmlogs_SC" {
#   description = "ApexHs_Prd_endpoint_vmlogs_SC"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "subresource_names_sa" {
#   description = "subresource_names_sa"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHSauxscriptsPrivateDNSRgName" {
#   description = "ApexHSauxscriptsPrivateDNSRgName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "private_dns_zone_scripts_name" {
#   description = "private_dns_zone_scripts_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "vnet_dns_link_scripts_name" {
#   description = "vnet_dns_link_scripts_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHs_uat_scriptssa_endpoint_name" {
#   description = "ApexHs_uat_scriptssa_endpoint_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ApexHs_Prd_endpoint_scripts_SC" {
#   description = "ApexHs_Prd_endpoint_scripts_SC"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "ApexHStstVmLogsRgName" {
#   description = "ApexHStstVmLogsRgName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
############ AVM Storage Account #######################

variable "avmsaRgName" {
  description = "avmsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsaResourceLocation" {
  description = "avmsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa" {
  description = "avmsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_accounttier" {
  description = "avmsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_storagetype" {
  description = "avmsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_accountreptype" {
  description = "avmsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_tlsversion" {
  description = "avmsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_accesstier" {
  description = "avmsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_httpstraffic" {
  description = "avmsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_publicaccess" {
  description = "avmsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_hnsenable" {
  description = "avmsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_nfsv3" {
  description = "avmsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_largefileshare" {
  description = "avmsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_acl" {
  description = "avmsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_bypass" {
  description = "avmsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "avmsa_routing" {
  description = "avmsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_publishinternet" {
  description = "avmsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_publishmicrosoft" {
  description = "avmsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "avmsaca" {
#   description = "avmsaca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
############ avmgen Storage Account #######################

variable "avmgenRgName" {
  description = "avmgenRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgenResourceLocation" {
  description = "avmgenResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen" {
  description = "avmgen"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_accounttier" {
  description = "avmgen_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_storagetype" {
  description = "avmgen_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_accountreptype" {
  description = "avmgen_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_tlsversion" {
  description = "avmgen_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_accesstier" {
  description = "avmgen_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_httpstraffic" {
  description = "avmgen_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_publicaccess" {
  description = "avmgen_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_hnsenable" {
  description = "avmgen_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_nfsv3" {
  description = "avmgen_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_largefileshare" {
  description = "avmgen_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_acl" {
  description = "avmgen_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_bypass" {
  description = "avmgen_bypass"
  default     = [""] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "avmgen_routing" {
  description = "avmgen_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_publishinternet" {
  description = "avmgen_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmgen_publishmicrosoft" {
  description = "avmgen_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "avmgenca" {
#   description = "avmgenca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }


###### auxScripts-SA #############
variable "auxScripts_minTlsVersion" {
  description = "auxScripts_minTlsVersion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_account_tier" {
  description = "auxScripts_account_tier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_account_replication_type" {
  description = "auxScripts_account_replication_type"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_storagetype" {
  description = "auxScripts_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_enable_https_traffic" {
  description = "auxScripts_enable_https_traffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_blob_public_access" {
  description = "auxScripts_blob_public_access"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_hns_enabled" {
  description = "auxScripts_hns_enabled"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_nfsv3_enabled" {
  description = "auxScripts_nfsv3_enabled"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_large_file_share" {
  description = "auxScripts_large_file_share"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_blob_soft_delete_retention_days" {
  description = "auxScripts_blob_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_container_delete_retention_policy_days" {
  description = "auxScripts_container_delete_retention_policy_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_share_soft_delete_retention_days" {
  description = "auxScripts_share_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_routing_preference" {
  description = "auxScripts_routing_preference"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_publish_internet_endpoints" {
  description = "auxScripts_publish_internet_endpoints"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_publish_microsoft_endpoints" {
  description = "auxScripts_publish_microsoft_endpoints"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_network_acl_action" {
  description = "auxScripts_network_acl_action"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_microsoft_trusted_services" {
  description = "auxScripts_microsoft_trusted_services"
  default     = [""] //intentionally kept it to something unrealistic
  type        = list(string)
}

########## SA PE ################
variable "saprivate_dns_zone_name" {
  description = "saprivate_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_subresource_names" {
  description = "auxScripts_subresource_names"
  default     = [""] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "apexuatpesubnetName" {
  description = "apexuatpesubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "apexuatpeVnetName" {
  description = "apexuatpeVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "apexuatpeVnetRgName" {
  description = "apexuatpeVnetRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_endpoint_name" {
  description = "auxScripts_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxScripts_endpoint_SC" {
  description = "auxScripts_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogs_endpoint_name" {
  description = "vmlogs_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmlogs_endpoint_SC" {
  description = "vmlogs_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsatst_endpoint_name" {
  description = "avmsatst_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsatst_endpoint_SC" {
  description = "avmsatst_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsanp_endpoint_name" {
  description = "avmsanp_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsanp_endpoint_SC" {
  description = "avmsanp_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
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

#### Diag settings #####

variable "category20" {
  default = "null"
  type    = string
}
variable "category21" {
  default = "null"
  type    = string
}
variable "category22" {
  default = "null"
  type    = string
}
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
