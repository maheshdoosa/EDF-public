################### Common variable #######################

variable "MDWHs-Tst-environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsResourceLocation" {
  description = "MDWHSResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "additionalTags" {
#   type        = map(string)
#   description = "Additional tags to be enforced"
#   default     = {}
# }

# variable "costcentre" {
#   description = "cost centre"
#   default     = "eit"
#   type        = string
# }

variable "prjKvName" {
  description = "prjKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "prjKvRgName" {
  description = "prjKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

################### AUX Storage variable ####################
variable "MDWHsTstAuxRgName" {
  description = "MDWHSTstAUXRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "auxScriptsSA" {
  description = "auxScriptsSA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

################## VM Loging Storage variable ################

variable "MDWHsTstVmLogsRgName" {
  description = "MDWHsTstVmLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmDiagTstSA" {
  description = "vmDiagSA"
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

######### RecoveryServiceVault ############

variable "MDWHsTstRSVRgName" {
  description = "MDWHsTstRSVRgName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}


variable "MDWHsTstRSVName" {
  description = "MDWHsTstRSVName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
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
#   description = "RSV diagnosticsetting_name"
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "log_category" {
#   description = "log category"
#   type        = string
#   default     = ""
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

variable "MDWHs_infraVM_backup_policy_01" {
  description = "MDWHsTst_infraVM_backup_policy_01"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHs_infraVM_backup_policy_02" {
  description = "MDWHsTst_infraVM_backup_policy_02"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "backup_policy_time_01" {
  description = "(Optional) sku of the resource"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}
variable "backup_policy_time_02" {
  description = "(Optional) sku of the resource"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "vm_backup_policy_timezone" {
  description = "vm_backup_policy_timezone"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "backup_policy_frequency" {
  description = "(Optional) sku of the resource"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}



variable "retention_daily_count" {
  description = "(Optional) sku of the resource"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "retention_weekly_count" {
  description = "(Optional) sku of the resource"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "retention_weekly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_monthly_count" {
  description = "(Optional) sku of the resource"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
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
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
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

################ Key VAult variable ##########################


variable "MDWHsTstkvRgName" {
  description = "MDWHsTstkvRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstkvName" {
  description = "MDWHsTstkvName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "sku_name" {
  description = "Key Vault Sku (Select Standard or Premium SKU of Azure keyvault)"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "enabled_for_deployment" {
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "enabled_for_disk_encryption" {
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "enabled_for_template_deployment" {
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted."
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "purge_protection_enabled" {
  description = "Purge Protection Defaults to false if Purge Protection has been Enabled it's not possible to Disable it "
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "default_action" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are 'Allow' and 'Deny' "
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "bypass" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices' and 'None' "
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

#######################Enabling Diagnostics Settings#######################

# variable "KV_diagnosticsetting_name" {
#   description = "The name of keyvault diagnostics settings name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

###############Keyvault Access Policy###################

# variable "object_id" {
#   description = "an object_id (user, service principal, security group)"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "Backup_Mngt_AppId" {
#   description = "Backup_Mngt_AppId (user, service principal, security group)"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
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


#########Creating privite DNS zone for MDWHs ########

variable "MDWHsPrivateDNSRgName" {
  description = "MDWHsPrivateDNSRgName"
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

variable "MDWHs_Tst_endpoint_name" {
  description = "Prod privite end point name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string

}

variable "MDWHs_Tst_endpoint_SC" {
  description = "Prod privite end point name Service connection name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


# variable "subnet_id" {
#   description = "subnet id"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "private_connection_resource_id" {
#   description = "Privite Connection resource id(keyvault/storage/sql)"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }

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

variable "MDWHsTstNetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "MDWHsTstVnetName" {
  description = "Vnet Name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "MDWHsTstSubnetName" {
  description = "subnet name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
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
variable "environment" {
  description = "environment"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_tlsversion" {
  description = "auxsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "auxsa_accountreptype" {
  description = "auxsa_accountreptype"
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
variable "sa_private_dns_zone_name" {
  description = "sa_private_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "vmDiagsa_endpoint_name" {
#   description = "vmDiagsa_endpoint_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "datapeSubnetName" {
#   description = "datapeSubnetName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "datapeVnetName" {
#   description = "datapeVnetName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "datapepNetworkingRgName" {
#   description = "datapepNetworkingRgName"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "vmDiagsa_endpoint_SC" {
#   description = "vmDiagsa_endpoint_SC"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "sapep_subresource_names" {
  description = "sapep_subresource_names"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
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
# variable "auxsa_endpoint_name" {
#   description = "auxsa_endpoint_name"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "auxsa_endpoint_SC" {
#   description = "auxsa_endpoint_SC"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "datadevpeSubnetName" {
  description = "datadevpeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "datadevVnetName" {
  description = "datadevVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "datadevNetworkingRgName" {
  description = "datadevNetworkingRgName"
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
  default = "null"
  type    = string
}
variable "categoryenabledfalse" {
  default = "null"
  type    = string
}
variable "retention_policy_enabled_true" {
  default = "null"
  type    = string
}
variable "retention_policy_enabled_false" {
  default = "null"
  type    = string
}
variable "retention_policydays" {
  default = "null"
  type    = string
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
