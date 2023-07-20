######### EMERSON Variables #############
variable "apexHsRgName" {
  description = "apexHsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexHsRgName_tst" {
  description = "apexHsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
# location
variable "apexHsResourceLocation" {
  description = "apexHsResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

########### Newly added variables #########
variable "apexnic01name" {
  description = "apexnic01name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexnic02name" {
  description = "apexnic02name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexTstnic01name" {
  description = "apexnic01name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexTstnic02name" {
  description = "apexnic02name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicIpConfigName" {
  description = "nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicIpConfigName02" {
  description = "nicIpConfigName02"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicIpTstConfigName01" {
  description = "nicIpTstConfigName01"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicIpTstConfigName02" {
  description = "nicIpTstConfigName02"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicipName" {
  description = "nicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicipName02" {
  description = "nicipName02"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicipTstName01" {
  description = "nicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "nicipTstName02" {
  description = "nicipName02"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "avSetname" {
#   description = "avSetname"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type = string
# }

variable "apexvm01Name" {
  description = "apexvm01Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexvm02Name" {
  description = "apexvm02Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexTstvm01Name" {
  description = "apexTstvm01Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexTstvm02Name" {
  description = "apexTstvm02Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmosDiskName" {
  description = "vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vm02osDiskName" {
  description = "vm02osDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmTstosDiskName" {
  description = "vmTstosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmTstosDiskName02" {
  description = "vmTstosDiskName02"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "vmstorageDiskName" {
#   description = "vmstorageDiskName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

#################

variable "storageAccountName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "storageAccountNametst" {
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

variable "bootDiagLogStorageAccountNametst" {
  description = "boot diagnostics logs storage account name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountRgNametst" {
  description = "boot diagnostics logs storage Rg name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "storageAccountKey" {
#   description = "Storage account access key"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "storageAccountKeytst" {
#   description = "Storage account access key"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "apexHsVnetName" {
  description = "vnet name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "apexHsTstVnetName" {
  description = "vnet name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexSubnetName" {
  description = "apexSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexTstSubnetName" {
  description = "apexSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "apexHsNetworkingRgName" {
  description = "vnet Rg name "
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexHsTstNetworkingRgName" {
  description = "vnet Rg name "
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexHsKvName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "DomainJoinFilePath" {
  description = "script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "DomainJoinFilePathtst" {
  description = "script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


# variable "prepVmPs1FilePath" {
#   description = "PS1 script file path"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

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
#   type        = string
# }

# variable "LAsettings" {
#   description = "workspace_id of Disk Encryption"
#   default     = null //intentionally kept it to something unrealistic
#   type        = string
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

variable "apexHsAdeKvName" {
  description = "managedSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexHsAdeKvRgName" {
  description = "managedSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexHsAdeTstKvName" {
  description = "managedSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "apexHsAdeTstKvRgName" {
  description = "managedSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
######### RecoveryServiceVault ############

variable "rsv_resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "rsv_resourceGroupName_tst" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}


variable "recovery_vault_name" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "recovery_vault_name_tst" {
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

variable "vm_name_tst" {
  description = "(Optional) sku of the resource"
  type = map(object({
    recovery_vault_name_tst   = string,
    rsv_resourceGroupName_tst = string,
    vm_id                     = string,
    policy_id                 = string
  }))
}

variable "adAdminGroup" {
  description = "The AD group that needs to be added in sudoers"
  type        = string
}


################# Variables for managed disk ####################################

variable "st_disk" {
  description = "(Optional) create disk"
  type = map(object({
    vmstorageDiskName    = string,
    disk_size_gb         = string,
    storage_account_type = string,
    create_option        = string
  }))
}

variable "vmstorageDiskNameDev01" {
  type        = string
  description = "Data disk for VM"

}

variable "vmstorageDiskNameDev02" {
  type        = string
  description = "Data disk for VM"

}

################# Variables for managed disk Tst ####################################

variable "tst_disk" {
  description = "(Optional) create disk"
  type = map(object({
    vmstorageDiskName    = string,
    disk_size_gb         = string,
    storage_account_type = string,
    create_option        = string
  }))
}

variable "vmstorageDiskNameTst01" {
  type        = string
  description = "Data disk for VM"

}

variable "vmstorageDiskNameTst02" {
  type        = string
  description = "Data disk for VM 02"

}
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
