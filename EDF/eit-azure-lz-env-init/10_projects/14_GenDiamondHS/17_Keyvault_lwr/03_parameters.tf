variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#managementHs key vault
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

# variable "tenant_id01" {
#   type        = string
#   description = "tenant_id of subsctiption"
#   default     = ""
# }

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

variable "diagnosticsetting_name01" {
  type        = string
  description = "The name of keyvault diagnostics settings name"
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
