#paas resource group
variable "lzmanagementSSVmLogsRgName" {
  description = "lzmanagementSSVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}
variable "lzmanagementSSSubLogsRgName" {
  description = "lzmanagementSSSubLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}
#managementSS paas location
variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
#storage accounts
variable "vmDiagSA" {
  description = "vmDiagSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "subLogsSA" {
  description = "subLogsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "subLogsSAImmutabilityRententionPeriod" {
  description = "subLogsSAImmutabilityRententionPeriod"
  type        = number
  default     = 1
}

variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#managementSS key vault
variable "managementSSKvName" {
  description = "managementSSKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managementSSKvRgName" {
  description = "managementSSKvRgName"
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

variable "LaName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "La_resource_group_name" {
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

############# Backup #############

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

variable "resource_group_name_pki" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "resource_group_name_wac" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "resource_group_name_wsus" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "resource_group_name_snow" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "resource_group_name_afs" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "vmName" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName2" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName3" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName4" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName5" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName6" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName7" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName8" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName9" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName10" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName11" {
  description = "Name of the VM"
  default     = {}
}

variable "vmName12" {
  description = "Name of the VM"
  default     = {}
}


######## AFS data sources secrets ################

variable "lzmanagementSsAFSSaName" {
  description = "lzmanagementSsAFSSaName"
  default     = ".tmp-loc"
}

variable "lzmanagementSsAFSFileShare" {
  description = "lzmanagementSsAFSFileShare"
  default     = ".tmp-loc"
}

variable "lzmanagementSsAFSSaSyncName" {
  description = "lzmanagementSsAFSSaSyncName"
  default     = ".tmp-loc"
}

variable "lzmanagementSsAFSVmRgName" {
  description = "AFS Vm RG Name"
  default     = ".tmp-loc"
}

variable "account_tier" {
  description = "Storage Account tier (Standard or Premium)"
  default     = ".tmp-sa"
}

variable "storagetype" {
  description = "Storage Account Type (StorageV2,Fileshare,etc..)"
  default     = ".tmp-sa"
}

variable "account_replication_type" {
  description = "Storage Account replication type"
  default     = ".tmp-sa"
}

variable "minTlsVersion" {
  description = "minTlsVersion"
  default     = ".tmp-sa"
}

variable "access_tier" {
  description = "Storage Account Access tier (Hot or Cold)"
  default     = ".tmp-sa"
}

variable "enable_https_traffic" {
  description = "enable_https_traffic for Stoarage Account"
  default     = ".tmp-sa"
}

variable "blob_public_access" {
  description = "enable_blob_public_access for Stoarage Account"
  default     = ".tmp-sa"
}

variable "hns_enabled" {
  description = "enable_hns_enabled file share"
  default     = ".tmp-sa"
}

variable "nfsv3_enabled" {
  description = "nfsv3_enabled"
  default     = ".tmp-sa"
}

variable "large_file_share" {
  description = " enable large_file_share"
  default     = ".tmp-sa"
}

variable "blob_soft_delete_retention_days" {
  description = "Storage Account blob_soft_delete_retention_days"
  default     = ".tmp-sa"
}

variable "container_delete_retention_policy_days" {
  description = "Storage Account blob_soft_delete_retention_days"
  default     = ".tmp-sa"
}

variable "share_soft_delete_retention_days" {
  description = "Storage Account share_soft_delete_retention_days"
  default     = ".tmp-sa"
}

variable "network_acl_action" {
  description = "Storage Account network_acl_action"
  default     = ".tmp-sa"
}

variable "microsoft_trusted_services" {
  description = "Storage Account routing_preference (microsoft_trusted_services)"
  default     = ".tmp-sa"
}

variable "routing_preference" {
  description = "Storage Account routing_preference (microsoft_trusted_services)"
  default     = ".tmp-sa"
}

variable "publish_internet_endpoints" {
  description = "Storage Account routing publish_internet_endpoints"
  default     = ".tmp-sa"
}

variable "publish_microsoft_endpoints" {
  description = "Storage Account routing_publish_microsoft_endpoints"
  default     = ".tmp-sa"
}

variable "fileshare_quota" {
  description = "Storage Account fileshare_quota"
  default     = ".tmp-sa"
}

variable "lzmanagementSsAFSPrivateEndpoint" {
  description = "lzmanagementSsAFSPrivateEndpoint"
  default     = ".tmp-sa"
}

variable "lzmanagementSsAuditSubnetName" {
  description = "lzmanagementSsAuditSubnetName"
  default     = ".tmp-sa"
}

variable "lzmanagementSsVnetName" {
  description = "lzmanagementSsVnetName"
  default     = ".tmp-sa"
}

variable "lzmanagementSsAFSServiceConnection" {
  description = "lzmanagementSsAFSServiceConnection"
  default     = ".tmp-sa"
}

variable "lzmanagementSsAFSSubResourceName" {
  description = "lzmanagementSsAFSSubResourceName"
  default     = ".tmp-sa"
}

variable "lzmanagementSsAFSRgName" {
  description = "lzmanagementSsAFSRgName"
  default     = ".tmp-rg"
}

variable "lzmanagementSsAFSVnetName" {
  description = "lzmanagementSsAFSVnetName"
  default     = ".tmp-rg"
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

variable "vnet_dns_link_name" {
  description = "Vnet to Private DNS link name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtPrivateDNSRgName" {
  description = "mgmtPrivateDNSRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "private_dns_zone_name" {
  description = "private_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "mgmt_vmsa_endpoint_name" {
  description = "mgmt_vmsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_vmsa_endpoint_SC" {
  description = "mgmt_vmsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "subresource_names" {
  description = "subresource_names"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtPrdSSVnetName" {
  description = "mgmtPrdSSVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtPrdSSNetworkingRgName" {
  description = "mgmtPrdSSNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtPrdSSSubnetName" {
  description = "mgmtPrdSSSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_vmsa_name" {
  description = "mgmt_vmsa_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_vmsa_resourceGroupName" {
  description = "mgmt_vmsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "mgmt_sublogsa_resourceGroupName" {
  description = "mgmt_sublogsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_sublogsa_endpoint_name" {
  description = "mgmt_sublogsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_sublogsa_endpoint_SC" {
  description = "mgmt_sublogsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_sublogsa_name" {
  description = "mgmt_sublogsa_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

################# KeyVault01 ##########################

variable "kv_resource_group_name01" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}

variable "resource_Location01" {
  description = "resource location"
  default     = ""
}

variable "keyvault_name01" {
  description = "The name of keyvault "
  default     = ""
}

variable "sku_name01" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}

variable "enabled_for_deployment01" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption01" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}

variable "enabled_for_template_deployment01" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days01" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled01" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action01" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass01" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

variable "diagnosticsetting_name01" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}

variable "aad_user01_01" {
  description = "AAD users Name"
  default     = ""
}

variable "aad_user01_02" {
  description = "AAD users Name"
  default     = ""
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

variable "enabled_for_deployment_adekv" {
  type        = string
  description = "Enable deployment"
  default     = ""
}

variable "sku_name_adekv" {
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

variable "enabled_for_deployment_avmkv" {
  type        = string
  description = "Enable deployment"
  default     = ""
}

variable "private_dns_zone_kv_name" {
  description = "private_dns_zone_kv_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "ntc_kv_resourceGroupName" {
  description = "ntc_kv_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "ntc_Prd_endpoint_name" {
  description = "ntc_Prd_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "ntc_Prd_endpoint_SC" {
  description = "ntc_Prd_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "subresource_names_kv" {
  description = "subresource_names_kv"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtpepSubnetName" {
  description = "mgmtpepSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtVnetName" {
  description = "mgmtVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtNetworkingRgName" {
  description = "mgmtNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "mgmtkvPrivateDNSRgName" {
  description = "mgmtkvPrivateDNSRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cred_kv_resourceGroupName" {
  description = "cred_kv_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cred_Prd_endpoint_name" {
  description = "cred_Prd_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "cred_Prd_endpoint_SC" {
  description = "cred_Prd_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "ade_kv_resourceGroupName" {
  description = "ade_kv_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "ade_Prd_endpoint_name" {
  description = "ade_Prd_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "ade_Prd_endpoint_SC" {
  description = "ade_Prd_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "avm_Prd_endpoint_name" {
  description = "avm_Prd_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "avm_Prd_endpoint_SC" {
  description = "avm_Prd_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

##### AVM ###############
variable "mgmtavmsaRgName" {
  description = "mgmtavmsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsaResourceLocation" {
  description = "mgmtavmsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa" {
  description = "mgmtavmsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_accounttier" {
  description = "mgmtavmsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_storagetype" {
  description = "mgmtavmsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_accountreptype" {
  description = "mgmtavmsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_tlsversion" {
  description = "mgmtavmsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_accesstier" {
  description = "mgmtavmsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_httpstraffic" {
  description = "mgmtavmsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_publicaccess" {
  description = "mgmtavmsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_hnsenable" {
  description = "mgmtavmsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_nfsv3" {
  description = "mgmtavmsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_largefileshare" {
  description = "mgmtavmsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_blobsoftdelete" {
  description = "mgmtavmsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_containersoftdelete" {
  description = "mgmtavmsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_sharesoftdelete" {
  description = "mgmtavmsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_acl" {
  description = "mgmtavmsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_bypass" {
  description = "mgmtavmsa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_routing" {
  description = "mgmtavmsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_publishinternet" {
  description = "mgmtavmsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsa_publishmicrosoft" {
  description = "mgmtavmsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtavmsaca" {
  description = "mgmtavmsaca"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}


########NTC ##########

variable "mgmtntcsaRgName" {
  description = "mgmtntcsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsaResourceLocation" {
  description = "mgmtntcsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa" {
  description = "mgmtntcsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_accounttier" {
  description = "mgmtntcsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_storagetype" {
  description = "mgmtntcsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_accountreptype" {
  description = "mgmtntcsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_tlsversion" {
  description = "mgmtntcsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_accesstier" {
  description = "mgmtntcsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_httpstraffic" {
  description = "mgmtntcsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_publicaccess" {
  description = "mgmtntcsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_hnsenable" {
  description = "mgmtntcsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_nfsv3" {
  description = "mgmtntcsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_largefileshare" {
  description = "mgmtntcsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_blobsoftdelete" {
  description = "mgmtntcsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_containersoftdelete" {
  description = "mgmtntcsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_sharesoftdelete" {
  description = "mgmtntcsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_acl" {
  description = "mgmtntcsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_bypass" {
  description = "mgmtntcsa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_routing" {
  description = "mgmtntcsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_publishinternet" {
  description = "mgmtntcsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsa_publishmicrosoft" {
  description = "mgmtntcsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsaca01" {
  description = "mgmtntcsaca01"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsaca02" {
  description = "mgmtntcsaca02"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtntcsaca03" {
  description = "mgmtntcsaca03"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}


##### aux ###############
variable "mgmtauxsaRgName" {
  description = "mgmtauxsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsaResourceLocation" {
  description = "mgmtauxsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa" {
  description = "mgmtauxsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_accounttier" {
  description = "mgmtauxsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_storagetype" {
  description = "mgmtauxsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_accountreptype" {
  description = "mgmtauxsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_tlsversion" {
  description = "mgmtauxsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_accesstier" {
  description = "mgmtauxsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_httpstraffic" {
  description = "mgmtauxsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_publicaccess" {
  description = "mgmtauxsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_hnsenable" {
  description = "mgmtauxsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_nfsv3" {
  description = "mgmtauxsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_largefileshare" {
  description = "mgmtauxsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_blobsoftdelete" {
  description = "mgmtauxsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_containersoftdelete" {
  description = "mgmtauxsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_sharesoftdelete" {
  description = "mgmtauxsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_acl" {
  description = "mgmtauxsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_bypass" {
  description = "mgmtauxsa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_routing" {
  description = "mgmtauxsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_publishinternet" {
  description = "mgmtauxsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsa_publishmicrosoft" {
  description = "mgmtauxsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsaca01" {
  description = "mgmtauxsaca01"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtauxsaca02" {
  description = "mgmtauxsaca02"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

##### cli ###############
variable "mgmtclisaRgName" {
  description = "mgmtclisaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisaResourceLocation" {
  description = "mgmtclisaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa" {
  description = "mgmtclisa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_accounttier" {
  description = "mgmtclisa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_storagetype" {
  description = "mgmtclisa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_accountreptype" {
  description = "mgmtclisa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_tlsversion" {
  description = "mgmtclisa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_accesstier" {
  description = "mgmtclisa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_httpstraffic" {
  description = "mgmtclisa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_publicaccess" {
  description = "mgmtclisa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_hnsenable" {
  description = "mgmtclisa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_nfsv3" {
  description = "mgmtclisa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_largefileshare" {
  description = "mgmtclisa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_blobsoftdelete" {
  description = "mgmtclisa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_containersoftdelete" {
  description = "mgmtclisa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_sharesoftdelete" {
  description = "mgmtclisa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_acl" {
  description = "mgmtclisa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_bypass" {
  description = "mgmtclisa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_routing" {
  description = "mgmtclisa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_publishinternet" {
  description = "mgmtclisa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisa_publishmicrosoft" {
  description = "mgmtclisa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmtclisaca" {
  description = "mgmtclisaca"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}



variable "mgmt_avmsa_resourceGroupName" {
  description = "mgmt_avmsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_avmsa_endpoint_name" {
  description = "mgmt_avmsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_avmsa_endpoint_SC" {
  description = "mgmt_avmsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_auxsa_resourceGroupName" {
  description = "mgmt_auxsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_auxsa_endpoint_name" {
  description = "mgmt_auxsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_auxsa_endpoint_SC" {
  description = "mgmt_auxsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_ntcsa_resourceGroupName" {
  description = "mgmt_ntcsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_ntcsa_endpoint_name" {
  description = "mgmt_ntcsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_ntcsa_endpoint_SC" {
  description = "mgmt_ntcsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_clisa_resourceGroupName" {
  description = "mgmt_clisa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_clisa_endpoint_name" {
  description = "mgmt_clisa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "mgmt_clisa_endpoint_SC" {
  description = "mgmt_clisa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}


###### Image gallery  ######

variable "lzmanagementSSVmimageRgName" {
  description = "lzmanagementSSVmimageRgName"
  default     = ".tmp-loc"
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
