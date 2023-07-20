variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

# key vault
variable "avdSSKvName" {
  description = "avdSSKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "avdSSKvRgName" {
  description = "avdSSKvRgName"
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
  description = "(Optional) backup policy time"
  type        = string
  default     = ""
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ""
}

variable "backup_policy_frequency" {
  description = "(Optional) backup policy frequency"
  type        = string
  default     = ""
}

variable "backup_policy_time" {
  description = "(Optional) backup policy time"
  type        = string
  default     = ""
}

variable "retention_daily_count" {
  description = "(Optional) backup policy count"
  type        = string
  default     = ""
}

variable "retention_weekly_count" {
  description = "(Optional) retension weekly count"
  type        = string
  default     = ""
}

variable "retention_weekly_weekdays" {
  description = "(Optional) retention weekly week days"
  type        = list(string)
  default     = []
}

variable "retention_monthly_count" {
  description = "(Optional) retention_monthly_count"
  type        = string
  default     = ""
}

variable "retention_monthly_weekdays" {
  description = "(Optional) retention_monthly_weekdays"
  type        = list(string)
  default     = []
}

variable "retention_monthly_weeks" {
  description = "(Optional) retention_monthly_weeks"
  type        = list(string)
  default     = []
}

variable "retention_yearly_count" {
  description = "(Optional) retention_yearly_count"
  type        = string
  default     = ""
}

variable "retention_yearly_weekdays" {
  description = "(Optional) retention_yearly_weekdays"
  type        = list(string)
  default     = []
}

variable "retention_yearly_weeks" {
  description = "(Optional) retention_yearly_weeks"
  type        = list(string)
  default     = []
}

variable "retention_yearly_months" {
  description = "(Optional) retention_yearly_months"
  type        = list(string)
  default     = []
}
#######################Enabling Diagnostics Settings#######################

variable "diagnosticsetting_name" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
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



################# KeyVault ##########################

variable "kv_resource_group_name" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}

variable "resource_Location" {
  description = "resource location"
  default     = ""
}

variable "keyvault_name" {
  description = "The name of keyvault "
  default     = ""
}

variable "sku_name" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}

variable "tenant_id" {
  type        = string
  description = "tenant_id of subsctiption"
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

variable "aad_user" {
  description = "AAD users Name"
  default     = ""
}

variable "aad_user1" {
  description = "AAD users Name"
  default     = ""
}



#paas resource group
variable "AVDVmLogsRgName" {
  description = "AVDVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "AVDResourceLocation" {
  description = "AVDResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
#storage accounts
variable "vmDiagSA" {
  description = "vmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmDiagtstSA" {
  description = "vmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_tlsversion" {
  description = "minTlsVersion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_accounttier" {
  description = "Storage Account tier (Standard or Premium)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_storagetype" {
  description = "Storage Account Type (StorageV2,Fileshare,etc..)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_httpstraffic" {
  description = "enable_https_traffic for Stoarage Account"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_publicaccess" {
  description = "enable_blob_public_access for Stoarage Account"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_hnsenable" {
  description = "enable_hns_enabled file share"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_nfsv3" {
  description = "nfsv3_enabled"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_largefileshare" {
  description = " enable large_file_share"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_accountreptype" {
  description = "Storage Account replication type"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_accesstier" {
  description = "Storage Account Access tier (Hot or Cold)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_blobsoftdelete" {
  description = "Storage Account blob_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_containersoftdelete" {
  description = "Storage Account blob_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_sharesoftdelete" {
  description = "Storage Account share_soft_delete_retention_days"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_acl" {
  description = "Storage Account network_acl_action"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_bypass" {
  description = "Allow trusted Microsoft Services to access this storage account "
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "routing_preference" {
  description = "Storage Account routing_preference (microsoft_trusted_services)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_routing" {
  description = "Storage Account routing_preference (microsoft_trusted_services)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_publishinternet" {
  description = "Storage Account routing publish_internet_endpoints"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "vmDiagSA_publishmicrosoft" {
  description = "Storage Account routing_publish_microsoft_endpoints"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}


######## AUX ##########

variable "cusauxsaRgName" {
  description = "cusauxsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsaResourceLocation" {
  description = "cusauxsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa" {
  description = "cusauxsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_accounttier" {
  description = "cusauxsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_storagetype" {
  description = "cusauxsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_accountreptype" {
  description = "cusauxsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_tlsversion" {
  description = "cusauxsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_accesstier" {
  description = "cusauxsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_httpstraffic" {
  description = "cusauxsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_publicaccess" {
  description = "cusauxsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_hnsenable" {
  description = "cusauxsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_nfsv3" {
  description = "cusauxsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_largefileshare" {
  description = "cusauxsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_blobsoftdelete" {
  description = "cusauxsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_containersoftdelete" {
  description = "cusauxsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_sharesoftdelete" {
  description = "cusauxsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_acl" {
  description = "cusauxsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_bypass" {
  description = "cusauxsa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_routing" {
  description = "cusauxsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_publishinternet" {
  description = "cusauxsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_publishmicrosoft" {
  description = "cusauxsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}



########### PE for SA #############


variable "saprivate_dns_zone_name" {
  description = "saprivate_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_resourceGroupName" {
  description = "cusauxsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_endpoint_name" {
  description = "cusauxsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_endpoint_SC" {
  description = "cusauxsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusauxsa_subresource_names" {
  description = "cusauxsa_subresource_names"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cuspesubnetName" {
  description = "cuspesubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusVnetName" {
  description = "cusVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusNetworkingRgName" {
  description = "cusNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusvmDiagsa_endpoint_name" {
  description = "cusvmDiagsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusvmDiagsa_endpoint_SC" {
  description = "cusvmDiagsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusvmDiagsa_resourceGroupName" {
  description = "cusvmDiagsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusvmDiagsaResourceLocation" {
  description = "cusvmDiagsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cusvmDiagsa_subresource_names" {
  description = "cusvmDiagsa_subresource_names"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
