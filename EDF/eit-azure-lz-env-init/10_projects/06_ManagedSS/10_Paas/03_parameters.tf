#paas resource group
variable "lzmanagedSSVmLogsRgName" {
  description = "lzmanagedSSVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#managedSS paas location
variable "lzHubManagedResourceLocation" {
  description = "lzHubManagedResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
#storage accounts
variable "vmDiagSA" {
  description = "vmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#managedSS key vault
variable "managedSSKvName" {
  description = "managedSSKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managedSSKvRgName" {
  description = "managedSSKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

######### RecoveryServiceVault ############

variable "resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "resourceLocation" {
  description = "resource location"
  default     = "" //intentionally kept it to something unrealistic
}

variable "costcentre" {
  description = "cost centre"
  default     = "eit"
}

variable "additionalTags" {
  type        = map(string)
  description = "Additional tags to be enforced"
  default     = {}
}

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

variable "rsvname" {
  description = "(Required) You can use a prefix to add to the list of resource groups you want to create"
  default     = ""
}

variable "recovery_vault_name" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID where the logs are sent"
  type        = string
  default     = null
}

variable "recovery_services_vault_id" {
  description = "recovery_services_vault id"
  type        = string
  default     = null
}

variable "log_category" {
  description = "log category"
  default     = ""
}

variable "log_category_enabled" {
  description = "log category"
  type        = string
  default     = ""
}

variable "log_category_retention" {
  description = "log category"
  type        = string
  default     = ""
}

variable "log_category_retention_days" {
  description = "log category"
  type        = string
  default     = ""
}

############# Backup Policy #############

variable "backup_policy_id" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "backup_policyId" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  default     = ""
}

variable "infraVM_backup_policy" {
  description = "Name of the backup policy which will be applied"
  default     = ""
}

variable "backup_policy_time_02" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ""
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

variable "source_vm_id" {
  description = "vmId"
  default     = {}
}

variable "resource_group_name" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "vmName" {
  description = "Name of the VM"
  default     = {}
}

################################ Ade Keyvault ######################

variable "ade_keyvault_name" {
  description = "The name of keyvault "
  default     = ""
}

variable "ade_kv_resource_group_name" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}

variable "enabled_for_disk_encryption_adekv" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}


################################ AVM Keyvault ######################

variable "avm_keyvault_name" {
  description = "The name of keyvault "
  default     = ""
}

variable "avm_kv_resource_group_name" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}


################# KeyVault ##########################


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
#######################Enabling Diagnostics Settings#######################

variable "diagnosticsetting_name" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}

###############Keyvault Access Policy###################

variable "key_vault_id" {
  type        = string
  description = "key vault id"
  default     = ""
}

variable "object_id" {
  type        = string
  description = "an object_id (user, service principal, security group)"
  default     = ""
}

variable "access_policies" {
  description = "Map of access policies for an object_id (user, service principal, security group) to backend."
  type = list(object({
    object_id               = string,
    certificate_permissions = list(string),
    key_permissions         = list(string),
    secret_permissions      = list(string),
    storage_permissions     = list(string),
  }))
  default = []
}

variable "aad_group" {
  description = "AAD Groups Name"
  default     = ""
}

variable "aad_user" {
  description = "AAD users Name"
  default     = ""
}



##################################Storage PE ########################################

variable "auxRgName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "auxPEName" {
  description = "auxPEName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}


variable "auxPEScName" {
  description = "auxPESCName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "private_dns_zone_name" {
  description = "rprivate_dns_zone_name "
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "auxSaName" {
  description = "Storage Account name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

########  AUX SA ##########

variable "managedSSsaRgName" {
  description = "managedSSsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsaRgLocation" {
  description = "managedSSsaRgLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa" {
  description = "managedSSsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_accounttier" {
  description = "managedSSsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_storagetype" {
  description = "managedSSsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_accountreptype" {
  description = "managedSSsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_tlsversion" {
  description = "managedSSsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_accesstier" {
  description = "managedSSsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_httpstraffic" {
  description = "managedSSsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_publicaccess" {
  description = "managedSSsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_hnsenable" {
  description = "managedSSsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_nfsv3" {
  description = "managedSSsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_largefileshare" {
  description = "managedSSsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_blobsoftdelete" {
  description = "managedSSsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_containersoftdelete" {
  description = "managedSSsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_sharesoftdelete" {
  description = "managedSSsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_acl" {
  description = "managedSSsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_bypass" {
  description = "managedSSsa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_routing" {
  description = "managedSSsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_publishinternet" {
  description = "managedSSsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSsa_publishmicrosoft" {
  description = "managedSSsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}


######## restore SA ##########

variable "managedSSrestoresaRgName" {
  description = "managedSSrestoresaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresaRgLocation" {
  description = "managedSSrestoresaRgLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa" {
  description = "managedSSrestoresa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_accounttier" {
  description = "managedSSrestoresa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_storagetype" {
  description = "managedSSrestoresa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_accountreptype" {
  description = "managedSSrestoresa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_tlsversion" {
  description = "managedSSrestoresa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_accesstier" {
  description = "managedSSrestoresa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_httpstraffic" {
  description = "managedSSrestoresa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_publicaccess" {
  description = "managedSSrestoresa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_hnsenable" {
  description = "managedSSrestoresa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_nfsv3" {
  description = "managedSSrestoresa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_largefileshare" {
  description = "managedSSrestoresa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_blobsoftdelete" {
  description = "managedSSrestoresa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_containersoftdelete" {
  description = "managedSSrestoresa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_sharesoftdelete" {
  description = "managedSSrestoresa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_acl" {
  description = "managedSSrestoresa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_bypass" {
  description = "managedSSrestoresa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_routing" {
  description = "managedSSrestoresa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_publishinternet" {
  description = "managedSSrestoresa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_publishmicrosoft" {
  description = "managedSSrestoresa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}


############# SA PE ################
variable "saprivate_dns_zone_name" {
  description = "saprivate_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSvmDiagsa_endpoint_name" {
  description = "managedSSvmDiagsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSvmDiagsa_endpoint_SC" {
  description = "managedSSvmDiagsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "sa_subresource_names" {
  description = "sa_subresource_names"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSpesubnetName" {
  description = "managedSSpesubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSVnetName" {
  description = "managedSSVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSNetworkingRgName" {
  description = "managedSSNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSauxsa_endpoint_SC" {
  description = "managedSSauxsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_endpoint_name" {
  description = "managedSSrestoresa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSrestoresa_endpoint_SC" {
  description = "managedSSrestoresa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "managedSSauxsa_endpoint_name" {
  description = "managedSSauxsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
