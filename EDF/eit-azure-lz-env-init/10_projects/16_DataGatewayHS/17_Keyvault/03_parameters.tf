################# KeyVault ##########################

#snowmidHS key vault
variable "KvName" {
  description = "KvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "KvRgName" {
  description = "KvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

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

variable "diagnosticsetting_name01" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
  default     = ""
}

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

#########Creating private endpoint and private DNS zone for keyvault ########

variable "private_dns_zone_name" {
  type        = string
  description = "The name of private dns name"
  default     = ""
}

# variable "private_dns_zone_group" {
#   type        = string
#   description = "The name of private dns group name"
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
  description = "private end point name"
  default     = ""

}

variable "endpoint_SC" {
  description = "private end point name Service connection name"
  default     = ""
  type        = string
}

# variable "subnet_id" {
#   description = "subnet id"
#   default     = ""
#   type        = string
# }

# variable "private_connection_resource_id" {
#   description = "private Connection resource id(keyvault/storage/sql)"
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

variable "NetworkingRgName" {
  description = "Vnet Rg Name"
  default     = ""
  type        = string
}

variable "VnetName" {
  description = "Vnet Name"
  default     = ""
  type        = string
}

variable "peSubnetName" {
  description = "subnet name"
  default     = ""
  type        = string
}

# variable "aad_group" {
#   description = "AAD Groups Name"
#   default     = ""
#   type        = string
# }

# variable "aad_user" {
#   description = "AAD users Name"
#   default     = ""
#   type        = string
# }

variable "diagnosticsetting_name02" {
  description = "diagnosticsetting_name02"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "diagnostic_logs01" {
  description = "An array of diagnostic logs to configure."
  type = list(object(
    {
      category = string
      enabled  = bool
      retention_policy = object(
        {
          enabled = bool
        }
      )
    }
    )
  )
  default = []
}
variable "diagnostic_metrics01" {
  description = "An array of diagnostic logs to configure."
  type = list(object(
    {
      category = string
      enabled  = bool
      retention_policy = object(
        {
          enabled = bool
        }
      )
    }
    )
  )
  default = []
}

variable "diagnostic_logs02" {
  description = "An array of diagnostic logs to configure."
  type = list(object(
    {
      category = string
      enabled  = bool
      retention_policy = object(
        {
          enabled = bool
        }
      )
    }
    )
  )
  default = []
}
variable "diagnostic_metrics02" {
  description = "An array of diagnostic logs to configure."
  type = list(object(
    {
      category = string
      enabled  = bool
      retention_policy = object(
        {
          enabled = bool
        }
      )
    }
    )
  )
  default = []
}
