######### Secgov Variables #############
variable "lzmanagedHssecgovRgName" {
  description = "lzmanagedHssecgovRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

# location
variable "lzHubManagedResourceLocation" {
  description = "lzHubManagedResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

########### Newly added variables #########
variable "eamnicName" {
  description = "eamnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "eamnicName02" {
  description = "eamnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicIpConfigName" {
  description = "nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "nicIpConfigName02" {
#   description = "nicIpConfigName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "nicipName" {
  description = "nicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "nicipName02" {
#   description = "nicipName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "avSetname" {
  description = "avSetname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "eamvmName" {
  description = "eamvmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "eamvmName02" {
  description = "eamvmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmosDiskName" {
  description = "vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmosDiskName02" {
  description = "vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmstorageDiskName" {
  description = "vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmstorageDiskName02" {
  description = "vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#################

variable "storageAccountName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "saContainerName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountName" {
  description = "boot diagnostics logs storage account name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountRgName" {
  description = "boot diagnostics logs storage Rg name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "storageAccountKey" {
#   description = "Storage account access key"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "lzmanagedHsVnetName" {
  description = "vnet name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "SecgovSubnetName" {
  description = "SecgovSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "lzmanagedHsNetworkingRgName" {
  description = "vnet Rg name "
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "managedHsKvName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "managementHsKvRgName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "gbRegionXmlFilePath" {
  description = "script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "prepVmPs1FilePath" {
  description = "PS1 script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

##################### Extensions #######################

# variable "MSMonitoringAgent" {
#   description = "Type of VM extension to be installed"
#   type        = bool
#   default     = false //intentionally kept it to something unrealistic
# }

# variable "MSDependencyAgent" {
#   description = "Type of VM extension to be installed"
#   type        = bool
#   default     = false //intentionally kept it to something unrealistic
# }

# variable "MSNetworkWatcher" {
#   description = "Type of VM extension to be installed"
#   type        = bool
#   default     = false //intentionally kept it to something unrealistic
# }

# variable "LAprotected_settings" {
#   description = "primary_shared_key of Log Analytics "
#   default     = null //intentionally kept it to something unrealistic
# }

# variable "LAsettings" {
#   description = "workspace_id of Disk Encryption"
#   default     = null //intentionally kept it to something unrealistic
# }

################### Azure Disk Encryption ###################

variable "KeyEncryptionAlgorithm" {
  description = "KeyEncryptionAlgorithm"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "EncryptionOperation" {
  description = "EncryptionOperation"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "VolumeType" {
  description = "VolumeType"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "managedHsAdeKvName" {
  description = "managedHsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "managedHsAdeKvRgName" {
  description = "managedHsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
######### RecoveryServiceVault ############

variable "rsv_resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "recovery_vault_name" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "infraVM_backup_policy" {
  description = "Name of the backup policy which will be applied"
  default     = ""
  type        = string
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ""
  type        = string
}

variable "vm_name" {
  description = "(Optional) sku of the resource"
  type = map(object({
    recovery_vault_name   = string,
    rsv_resourceGroupName = string,
    vm_id                 = string,
    policy_id             = string
  }))
}



variable "lzmanagedHssecgovtenableRgName" {
  description = "lzmanagedHssecgovtenableRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "tenablenicName" {
  description = "tenablenicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "tenableSubnetName" {
  description = "tenableSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


variable "tenablenicIpConfigName" {
  description = "tenablenicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


# variable "sssecgov03PrivateIpAddress" {
#   description = "sssecgov03PrivateIpAddress"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }


variable "tenablevmname" {
  description = "tenablevmname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogtenableStorageAccountName" {
  description = "bootDiagLogtenableStorageAccountName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "bootDiagLogtenableStorageAccountRgName" {
  description = "bootDiagLogtenableStorageAccountRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


variable "disks" {
  type = map(object({
    diskname = string
    vmrgName = string
    diskSize = string
  }))
  description = "Define Azure disks"
  default     = {}
}

variable "storage_account_type" {
  type        = string
  description = "storage_account_type"
  default     = ""
}
variable "create_option" {
  type        = string
  description = "create_option"
  default     = ""
}
# variable "diskSize" {
#   type        = string
#   description = "diskSize"
#   default     = ""
# }

variable "lztenablezone" {
  description = "lztenablezone"
  default     = [".tmp "]
  type        = list(string)
}

variable "caching" {
  description = "caching"
  default     = ".tmp "
  type        = string
}

variable "Tenable_data_disk" {
  description = "Tenable_data_disk"
  default     = ".tmp "
  type        = string
}
variable "disk_lun_01" {
  description = "disk_lun_01"
  default     = ".tmp "
  type        = string
}
variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  default     = ""
  type        = string
}

#############
variable "lapsFilePath" {
  description = "lapsFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
