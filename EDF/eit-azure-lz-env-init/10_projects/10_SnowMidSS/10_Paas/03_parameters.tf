#paas resource group
variable "snowmidSSVmLogsRgName" {
  description = "snowmidSSVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#snowmiddSS paas location  //updated
variable "snowmidSSResourceLocation" {
  description = "snowmidSSResourceLocation"
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
variable "snowmidSSKvName" {
  description = "snowmidSSKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "snowmidSSKvRgName" {
  description = "snowmidSSKvRgName"
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

#########Creating private endpoint and privite DNS zone for keyvault ########

variable "private_dns_zone_name" {
  type        = string
  description = "The name of Privite dns name"
  default     = ""
}

variable "dns_resource_group_name" {
  type        = string
  description = "The name of Privite dns name"
  default     = ""
}

variable "private_dns_zone_group" {
  type        = string
  description = "The name of Privite dns group name"
  default     = ""
}

variable "vnet_dns_link_name" {
  type        = string
  description = "Vnet to Private DNS link name"
  default     = ""
}

variable "virtual_network_id" {
  type        = string
  description = "Vnet ID"
  default     = ""
}

variable "endpoint_name" {
  type        = string
  description = "privite end point name"
  default     = ""

}

variable "endpoint_SC" {
  description = "privite end point name Service connection name"
  default     = ""
}

variable "subnet_id" {
  description = "subnet id"
  default     = ""
}

variable "private_connection_resource_id" {
  description = "Privite Connection resource id(keyvault/storage/sql)"
  default     = ""
}

variable "is_manual_connection" {
  description = "If you are trying to connect the Private Endpoint to a remote resource without having the correct RBAC permissions on the remote resource set this value to true"
  default     = ""
}

variable "subresource_names" {
  description = "A list of subresource names which the Private Endpoint is able to connect"
  default     = [""]
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "The name of an private DNS Zone"
  default     = [""]
}

variable "lzsandpitNetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ""
}

variable "lzsandpitVnetName" {
  description = "Vnet Name"
  default     = ""
}

variable "peSubnetName" {
  description = "subnet name"
  default     = ""
}

variable "aad_group" {
  description = "AAD Groups Name"
  default     = ""
}

variable "aad_user" {
  description = "AAD users Name"
  default     = ""
}


######## AUX SA ##########

variable "secgovauxsaRgName" {
  description = "secgovauxsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsaResourceLocation" {
  description = "secgovauxsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa" {
  description = "secgovauxsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_accounttier" {
  description = "secgovauxsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_storagetype" {
  description = "secgovauxsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_accountreptype" {
  description = "secgovauxsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_tlsversion" {
  description = "secgovauxsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_accesstier" {
  description = "secgovauxsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_httpstraffic" {
  description = "secgovauxsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_publicaccess" {
  description = "secgovauxsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_hnsenable" {
  description = "secgovauxsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_nfsv3" {
  description = "secgovauxsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_largefileshare" {
  description = "secgovauxsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_blobsoftdelete" {
  description = "secgovauxsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_containersoftdelete" {
  description = "secgovauxsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_sharesoftdelete" {
  description = "secgovauxsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_acl" {
  description = "secgovauxsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_bypass" {
  description = "secgovauxsa_bypass"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_routing" {
  description = "secgovauxsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_publishinternet" {
  description = "secgovauxsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_publishmicrosoft" {
  description = "secgovauxsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}



variable "saprivate_dns_zone_name" {
  description = "saprivate_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_resourceGroupName" {
  description = "secgovauxsa_resourceGroupName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_endpoint_name" {
  description = "secgovauxsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_endpoint_SC" {
  description = "secgovauxsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovauxsa_subresource_names" {
  description = "secgovauxsa_subresource_names"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovpesubnetName" {
  description = "secgovpesubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovVnetName" {
  description = "secgovVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovNetworkingRgName" {
  description = "secgovNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovvmDiagsa_endpoint_name" {
  description = "secgovvmDiagsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "secgovvmDiagsa_endpoint_SC" {
  description = "secgovvmDiagsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
