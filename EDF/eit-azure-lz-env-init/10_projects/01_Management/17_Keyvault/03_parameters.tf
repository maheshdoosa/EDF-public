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

############# Access Policy ##########
/*
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
*/
########## Imported Key Vault

variable "kv_resource_group_name" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
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
/*
variable "diagnosticsetting_name" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
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

######### Imported Key Vault01

variable "kv_resource_group_name01" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location01" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name01" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name01" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id01" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
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
/*
variable "diagnosticsetting_name01" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
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

######### Imported Key Vault02

variable "kv_resource_group_name02" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location02" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name02" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name02" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id02" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment02" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption02" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name02" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment02" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days02" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled02" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action02" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass02" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault03

variable "kv_resource_group_name03" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location03" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name03" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name03" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id03" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment03" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption03" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name03" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment03" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days03" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled03" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action03" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass03" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault04

variable "kv_resource_group_name04" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location04" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name04" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name04" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id04" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment04" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption04" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name04" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment04" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days04" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled04" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action04" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass04" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault05

variable "kv_resource_group_name05" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location05" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name05" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name05" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id05" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment05" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption05" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name05" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment05" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days05" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled05" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action05" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass05" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault06

variable "kv_resource_group_name06" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location06" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name06" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name06" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id06" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment06" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption06" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name06" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment06" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days06" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled06" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action06" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass06" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault07

variable "kv_resource_group_name07" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location07" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name07" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name07" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id07" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment07" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption07" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name07" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment07" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days07" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled07" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action07" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass07" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault08

variable "kv_resource_group_name08" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location08" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name08" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name08" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id08" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment08" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption08" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name08" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment08" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days08" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled08" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action08" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass08" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault09

variable "kv_resource_group_name09" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location09" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name09" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name09" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id09" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment09" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption09" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name09" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment09" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days09" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled09" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action09" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass09" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault10

variable "kv_resource_group_name10" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location10" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name10" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name10" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id10" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment10" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption10" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name10" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment10" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days10" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled10" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action10" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass10" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault11

variable "kv_resource_group_name11" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location11" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name11" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name11" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id11" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment11" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption11" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name11" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment11" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days11" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled11" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action11" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass11" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault12

variable "kv_resource_group_name12" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location12" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name12" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name12" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id12" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment12" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption12" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name12" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment12" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days12" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled12" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action12" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass12" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault13

variable "kv_resource_group_name13" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location13" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name13" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name13" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id13" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment13" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption13" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name13" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment13" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days13" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled13" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action13" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass13" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault14

variable "kv_resource_group_name14" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location14" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name14" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name14" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id14" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment14" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption14" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name14" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment14" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days14" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled14" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action14" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass14" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault15

variable "kv_resource_group_name15" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location15" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name15" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name15" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id15" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment15" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption15" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name15" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment15" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days15" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled15" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action15" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass15" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

variable "aad_user15_01" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

variable "aad_user15_02" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault16

variable "kv_resource_group_name16" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location16" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name16" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name16" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id16" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment16" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption16" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name16" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment16" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days16" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled16" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action16" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass16" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault17

variable "kv_resource_group_name17" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location17" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name17" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name17" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id17" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment17" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption17" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name17" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment17" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days17" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled17" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action17" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass17" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault18

variable "kv_resource_group_name18" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location18" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name18" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name18" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id18" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment18" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption18" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name18" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment18" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days18" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled18" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action18" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass18" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

######### Imported Key Vault19

variable "kv_resource_group_name19" {
  description = "kv_rg"
  default     = ".tmp-rg"
  type        = string
}

variable "resource_Location19" {
  description = "kv_loc"
  default     = ".tmp-rg"
  type        = string
}

variable "keyvault_name19" {
  description = "keyvault_name"
  default     = ".tmp-rg"
  type        = string
}

variable "sku_name19" {
  type        = string
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ""
}
/*
variable "tenant_id19" {
  type        = string
  description = "tenant_id of subsctiption"
  default     = ""
}
*/
variable "enabled_for_deployment19" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ""
}

variable "enabled_for_disk_encryption19" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ""
}
/*
variable "diagnosticsetting_name19" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}
*/
variable "enabled_for_template_deployment19" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ""
}
variable "soft_delete_retention_days19" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = string
  default     = ""
}
variable "purge_protection_enabled19" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  type        = string
  default     = ""
}

variable "default_action19" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  type        = string
  default     = ""
}

variable "bypass19" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  type        = string
  default     = ""
}

variable "diagsettingakv" {
  type    = list(any)
  default = []
}

variable "diagsettingakv15" {
  type    = list(any)
  default = []
}

variable "diagsettingakv17" {
  type    = list(any)
  default = []
}

variable "diagsettingakv18" {
  type    = list(any)
  default = []
}

variable "diagsettingakv19" {
  type    = list(any)
  default = []
}
