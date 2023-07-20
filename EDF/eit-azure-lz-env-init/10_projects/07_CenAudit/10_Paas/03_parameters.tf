##########################################

variable "cenadtSubLogsRgName" {
  description = "cenAuditSubLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
#managementSS paas location
variable "cenadtResourceLocation" {
  description = "cenadtResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
#storage accounts

variable "subLogsSA" {
  description = "subLogsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSAImmutabilityRetentionPeriod" {
  description = "subLogsSAImmutabilityRetentionPeriod"
  type        = number
  default     = 1
}

variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#cenadt key vault
variable "cenadtKvName" {
  description = "cenadtKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtKvRgName" {
  description = "cenadtKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

# variable "tenantId" {
#   description = "tenantId"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "SubscriptionId" {
  description = "SubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtContributorSPAppId" {
  description = "cenadtContributorSPAppId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtContributorSPSecret" {
  description = "cenadtContributorSPSecret"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

################
variable "lzcenadtHSbootdiagsaRgName" {
  description = "lzcenadtHSbootdiagsaRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzHubcenadtResourceLocation" {
  description = "lzHubcenadtResourceLocation"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSAname" {
  description = "vmDiagSAname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
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
variable "soft_delete_enabled" {
  description = "(Optional) soft delete enabled of the resource"
  type        = bool
  default     = true
}
# variable "rsvname" {
#   description = "(Required) You can use a prefix to add to the list of resource groups you want to create"
#   default     = ""
# }
variable "recovery_vault_name" {
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
# ############# Backup Policy #############
# variable "backup_policy_id" {
#   description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
#   type        = string
#   default     = ""
# }
# variable "backup_policyId" {
#   description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
#   default     = ""
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
################# KeyVault ##########################
variable "kv_resource_group_name" {
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
# variable "diagnosticsetting_name" {
#   type        = string
#   description = "The name of keyvault diagnostics settings name"
#   default     = ""
# }
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
#########Creating private endpoint and privite DNS zone for keyvault ########
variable "private_dns_zone_name" {
  type        = string
  description = "The name of Privite dns name"
  default     = ""
}
variable "sa_private_dns_zone_name" {
  type        = string
  description = "The name of Privite dns name"
  default     = ""
}

# variable "private_dns_zone_group" {
#   type        = string
#   description = "The name of Privite dns group name"
#   default     = ""
# }

# variable "vnet_dns_link_name" {
#   type        = string
#   description = "Vnet to Private DNS link name"
#   default     = ""
# }

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
# }

# variable "private_connection_resource_id" {
#   description = "Privite Connection resource id(keyvault/storage/sql)"
#   default     = ""
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

variable "lzpepNetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ""
  type        = string
}

variable "lzpepVnetName" {
  description = "Vnet Name"
  default     = ""
  type        = string
}

variable "peSubnetName" {
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
################ SA EP ##########
variable "sa_endpoint_name" {
  description = "sa_endpoint_name"
  default     = ""
  type        = string
}
variable "sa_endpoint_SC" {
  description = "privite end point name Service connection name"
  default     = ""
  type        = string
}
variable "sapep_subresource_names" {
  description = "privite end point name subresource_names"
  default     = [""]
  type        = list(string)
}

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
############ subLogsSA Storage Account #######################

variable "subLogsSARgName" {
  description = "subLogsSARgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSAResourceLocation" {
  description = "subLogsSAResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_accounttier" {
  description = "subLogsSA_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_storagetype" {
  description = "subLogsSA_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_accountreptype" {
  description = "subLogsSA_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_tlsversion" {
  description = "subLogsSA_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_accesstier" {
  description = "subLogsSA_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_httpstraffic" {
  description = "subLogsSA_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_publicaccess" {
  description = "subLogsSA_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_hnsenable" {
  description = "subLogsSA_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_nfsv3" {
  description = "subLogsSA_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_largefileshare" {
  description = "subLogsSA_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_acl" {
  description = "subLogsSA_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_bypass" {
  description = "subLogsSA_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "subLogsSA_routing" {
  description = "subLogsSA_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_publishinternet" {
  description = "subLogsSA_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_publishmicrosoft" {
  description = "subLogsSA_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "subLogsSAca" {
#   description = "subLogsSAca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "subLogsSA_blobsoftdelete" {
  description = "subLogsSA_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_containersoftdelete" {
  description = "subLogsSA_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_sharesoftdelete" {
  description = "subLogsSA_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
############ vmDiagSA Storage Account #######################

variable "vmDiagSARgName" {
  description = "vmDiagSARgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSAResourceLocation" {
  description = "vmDiagSAResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA" {
  description = "vmDiagSA"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_accounttier" {
  description = "vmDiagSA_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_storagetype" {
  description = "vmDiagSA_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_accountreptype" {
  description = "vmDiagSA_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_tlsversion" {
  description = "vmDiagSA_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_accesstier" {
  description = "vmDiagSA_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_httpstraffic" {
  description = "vmDiagSA_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_publicaccess" {
  description = "vmDiagSA_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_hnsenable" {
  description = "vmDiagSA_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_nfsv3" {
  description = "vmDiagSA_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_largefileshare" {
  description = "vmDiagSA_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_acl" {
  description = "vmDiagSA_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_bypass" {
  description = "vmDiagSA_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "vmDiagSA_routing" {
  description = "vmDiagSA_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_publishinternet" {
  description = "vmDiagSA_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_publishmicrosoft" {
  description = "vmDiagSA_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "vmDiagSAca" {
#   description = "vmDiagSAca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "vmDiagSA_blobsoftdelete" {
  description = "vmDiagSA_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_containersoftdelete" {
  description = "vmDiagSA_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmDiagSA_sharesoftdelete" {
  description = "vmDiagSA_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_endpoint_name" {
  description = "subLogsSA_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "subLogsSA_endpoint_SC" {
  description = "subLogsSA_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_endpoint_name" {
  description = "avmsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_endpoint_SC" {
  description = "avmsa_endpoint_SC"
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
