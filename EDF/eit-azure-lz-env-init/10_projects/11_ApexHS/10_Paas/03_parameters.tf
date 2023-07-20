#paas resource group
variable "ApexHSVmLogsRgName" {
  description = "ApexHSVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ApexHStstVmLogsRgName" {
  description = "ApexHSVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
#ApexHSS paas location  //updated
variable "ApexHSResourceLocation" {
  description = "ApexHSResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
#storage accounts
variable "vmDiagSA" {
  description = "vmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagtstSA" {
  description = "vmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

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

#apex key vault
variable "apexKvName" {
  description = "apexKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexKvRgName" {
  description = "apexKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


################# KeyVault ##########################

variable "kv_resource_group_name" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}

variable "kv_resource_group_name_tst" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}
variable "resource_Location" {
  description = "resource location"
  default     = ""
  type        = string
}

variable "keyvault_name" {
  description = "The name of keyvault "
  default     = ""
  type        = string
}

variable "keyvault_name_tst" {
  description = "The name of keyvault "
  default     = ""
  type        = string
}

variable "sku_name" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}

# variable "tenant_id" {
#   type        = string
#   description = "tenant_id of subsctiption"
#   default     = ""
# }

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

#######################Enabling Diagnostics Settings#######################

# variable "diagnosticsetting_name" {
#   type        = string
#   description = "The name of keyvault diagnostics settings name"
#   default     = ""
# }

###############Keyvault Access Policy###################

# variable "key_vault_id" {
#   type        = string
#   description = "key vault id"
#   default     = ""
# }

# variable "object_id" {
#   type        = string
#   description = "an object_id (user, service principal, security group)"
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

#########Creating private endpoint and privite DNS zone for keyvault ########

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

variable "vnet_dns_link_name" {
  type        = string
  description = "Vnet to Private DNS link name"
  default     = ""
}

# variable "virtual_network_id" {
#   type        = string
#   description = "Vnet ID"
#   default     = ""
# }

variable "endpoint_name" {
  type        = string
  description = "privite end point name"
  default     = ""

}

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

variable "lzdevNetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ""
  type        = string
}

variable "lztstNetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ""
  type        = string
}

variable "lzdevVnetName" {
  description = "Vnet Name"
  default     = ""
  type        = string
}

variable "lztstVnetName" {
  description = "Vnet Name"
  default     = ""
  type        = string
}

variable "peSubnetName" {
  description = "subnet name"
  default     = ""
  type        = string
}

variable "peSubnetName_tst" {
  description = "subnet name"
  default     = ""
  type        = string
}

variable "aad_group" {
  description = "AAD Groups Name"
  default     = ""
  type        = string
}

variable "aad_user" {
  description = "AAD users Name"
  default     = ""
  type        = string
}

#apexHS key vault
# variable "apexDevHSKvName" {
#   description = "apexDevHSKvName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "apexDevHSKvRgName" {
#   description = "apexDevHSKvRgName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

######### RecoveryServiceVault ############

variable "resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "resourceGroupName_tst" {
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

variable "recovery_vault_name_tst" {
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

############## Key vault to create RSA keys ###############3


# variable "keys" {
#   type = map(object({
#     key_name = string
#     key_type = string
#     key_size = string
#   }))
#   description = "Define Azure Key Vault keys"
#   default     = {}
# }
############ AVM Storage Account #######################
/*
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
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
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
variable "avmsaca" {
  description = "avmsaca"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
*/

############ auxtstSA Storage Account #######################

variable "auxtstSARgName" {
  description = "auxtstSARgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSAResourceLocation" {
  description = "auxtstSAResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA" {
  description = "auxtstSA"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_accounttier" {
  description = "auxtstSA_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_storagetype" {
  description = "auxtstSA_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_accountreptype" {
  description = "auxtstSA_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_tlsversion" {
  description = "auxtstSA_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_accesstier" {
  description = "auxtstSA_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_httpstraffic" {
  description = "auxtstSA_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_publicaccess" {
  description = "auxtstSA_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_hnsenable" {
  description = "auxtstSA_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_nfsv3" {
  description = "auxtstSA_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_largefileshare" {
  description = "auxtstSA_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_acl" {
  description = "auxtstSA_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_bypass" {
  description = "auxtstSA_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "auxtstSA_routing" {
  description = "auxtstSA_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_publishinternet" {
  description = "auxtstSA_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_publishmicrosoft" {
  description = "auxtstSA_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "auxtstSAca" {
#   description = "auxtstSAca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "auxtstSA_blobsoftdelete" {
  description = "auxtstSA_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_containersoftdelete" {
  description = "auxtstSA_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtstSA_sharesoftdelete" {
  description = "auxtstSA_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
############ auxdevsa Storage Account #######################

variable "auxdevsaRgName" {
  description = "auxdevsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsaResourceLocation" {
  description = "auxdevsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa" {
  description = "auxdevsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_accounttier" {
  description = "auxdevsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_storagetype" {
  description = "auxdevsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_accountreptype" {
  description = "auxdevsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_tlsversion" {
  description = "auxdevsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_accesstier" {
  description = "auxdevsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_httpstraffic" {
  description = "auxdevsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_publicaccess" {
  description = "auxdevsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_hnsenable" {
  description = "auxdevsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_nfsv3" {
  description = "auxdevsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_largefileshare" {
  description = "auxdevsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_acl" {
  description = "auxdevsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_bypass" {
  description = "auxdevsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "auxdevsa_routing" {
  description = "auxdevsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_publishinternet" {
  description = "auxdevsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_publishmicrosoft" {
  description = "auxdevsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "auxdevsaca" {
#   description = "auxdevsaca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "auxdevsa_blobsoftdelete" {
  description = "auxdevsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_containersoftdelete" {
  description = "auxdevsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "apextstpesubnetName" {
  description = "apextstpesubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

############# SA PE ############
variable "apextstpeVnetName" {
  description = "apextstpeVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "apextstpeVnetRgName" {
  description = "apextstpeVnetRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "saprivate_dns_zone_name" {
  description = "saprivate_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagDev_endpoint_name" {
  description = "vmDiagDev_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagDev_endpoint_SC" {
  description = "vmDiagDev_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "sa_subresource_names" {
  description = "sa_subresource_names"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "vmDiagtst_endpoint_name" {
  description = "vmDiagtst_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagtst_endpoint_SC" {
  description = "vmDiagtst_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdev_endpoint_name" {
  description = "auxdev_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdev_endpoint_SC" {
  description = "auxdev_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtst_endpoint_name" {
  description = "auxtst_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxtst_endpoint_SC" {
  description = "auxtst_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxdevsa_sharesoftdelete" {
  description = "auxdevsa_sharesoftdelete"
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
