variable "environment" {
  description = "environment"
  default     = ".tmp"
  type        = string
}
variable "ComsyHSResourceLocation" {
  description = "ComsyHSResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
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

######### RecoveryServiceVault ############

variable "ComsyHS_rsv_resourceGroupName" {
  description = "ComsyHS_rsv_resourceGroupName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHS_recovery_vault_name" {
  description = "ComsyHS_recovery_vault_name"
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


# variable "RSV_diagnosticsetting_name" {
#   description = "RSV_diagnosticsetting_name"
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

variable "ComsyHS_kv_resourceGroupName" {
  type        = string
  description = "The name of keyvault Resource Group"
  default     = ""
}

variable "ComsyHS_keyvault_name" {
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

#########Creating privite DNS zone for ComsyHs ########

# variable "ComsyHSPrivateDNSRgName" {
#   description = "ComsyHSPrivateDNSRgName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "private_dns_zone_name" {
  description = "The name of Privite dns name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


# variable "vnet_dns_link_name" {
#   description = "Vnet to Private DNS link name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

#########Creating privite endPoint Integration for MDWHs ########

variable "ComsyHs_Prd_endpoint_name" {
  description = "Prod privite end point name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string

}

variable "ComsyHs_Prd_endpoint_SC" {
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

variable "ComsyHsPrdNetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "ComsyHsPrdVnetName" {
  description = "Vnet Name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "ComsyHsPrdSubnetName" {
  description = "subnet name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

################# SQL DB ########################
variable "comsySQLPaaSRgName" {
  description = "resoruce group of SQL Server"
  default     = ".tmp"
  type        = string
}
variable "comsySQLServerName" {
  type        = string
  description = "The name of the Azure SQL Server"
  default     = ".tmp"
}
variable "comsySqlServerVersion" {
  description = "version Azure SQL Server"
  default     = ".tmp"
  type        = string
}
variable "comsySqlPrivateEndpointDecision" {
  description = "Private endpoint for SQL to be deployed or not. Decision will be true or false"
  default     = "false"
  type        = string
}
variable "comsySqlDBNames" {
  type        = list(string)
  description = "List of Azure SQL database names"
  default     = []
}
variable "comsySqlDBMaxSize" {
  type        = number
  description = "The max size of the database in gigabytes"
  default     = "4"
}
variable "comsySqlDBSkuName" {
  type        = string
  description = "Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
  default     = "GP_Gen4_2" # for example "The sku-name parameter consists of 3 parts: Tier (B for Basic, GP for General Purpose, MO for Memory Optimized), Compute (Gen4 or Gen5), and Scale (1-32 vCores) -for example, GPGen42.
}
variable "comsySqlDBZoneRedundantDecision" {
  type        = bool
  description = "Specifies whether SQL DB will be zone Redundant or not. Possible values are true or false"
  default     = "true"
}
variable "comsySqlDBFailoverDecision" {
  type        = bool
  description = "If set to true, enable failover Azure SQL Server"
  default     = "false"
}
variable "comsySqlDBFailoverLocation" {
  type        = string
  description = "Specifies the supported Azure location where the failover Azure SQL Server exists"
  default     = "null"
}
variable "endpointFailoverPolicyModeDecision" {
  type        = string
  description = "The failover mode. Possible values are Manual, Automatic"
  default     = "Automatic"

}
variable "privateEndpointSubnetName" {
  description = "Name of the Subnet where Private endpoint for Comsy SQL will be created"
  default     = ".tmp"
  type        = string
}
variable "privateEndpointVNETName" {
  description = "Name of the VNET where Private endpoint for Comsy SQL will be created"
  default     = ".tmp"
  type        = string
}
variable "privateEndpointVNETRgName" {
  description = "Name of the networking (VNET) resoruce group where Private endpoint for Comsy SQL will be created"
  default     = ".tmp"
  type        = string
}
variable "comsySQLEndPointName" {
  description = "Name of Private Endpoint for SQL PaaS"
  default     = ".tmp"
  type        = string
}
variable "comsySQLServiceConnName" {
  description = "Service connection name which is created for SQL PaaS "
  default     = ".tmp"
  type        = string
}
variable "privateEndpointSubResourceName" {
  description = "Private endpoint subresoruce names can be reffered here https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview "
  default     = [".tmp"]
  type        = list(string)
}
# variable "comsySQLLinkScopeId" {
#   description = "Linkscope ID for the  "
#   default     = ".tmp"
#   type        = string
# }
variable "comsySqldbname" {
  description = "comsySqldbname"
  default     = ".tmp"
  type        = string
}
variable "azuread_authentication_only" {
  type        = string
  description = "azuread_authentication_only"
  #default     = "Automatic"
}
variable "sqldbazureadgroup" {
  type        = string
  description = "sqldbazureadgroup"
  #default     = "Automatic"
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
variable "category23" {
  default = "null"
  type    = string
}
variable "category24" {
  default = "null"
  type    = string
}
variable "category25" {
  default = "null"
  type    = string
}
variable "category26" {
  default = "null"
  type    = string
}
variable "category27" {
  default = "null"
  type    = string
}
variable "category28" {
  default = "null"
  type    = string
}
variable "category29" {
  default = "null"
  type    = string
}
variable "category30" {
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

variable "category31" {
  default = "null"
  type    = string
}
variable "category32" {
  default = "null"
  type    = string
}
variable "category33" {
  default = "null"
  type    = string
}
