# variable "scriptsstorageAccountName" {
#   description = "scriptsstorageAccountName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "saContainerName" {
#   description = "extension script"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "ControlMHssandvmRgName" {
  description = "controlMHssandvmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "ControlMHsResourceLocation" {
  description = "controlMHsResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ControlMHssandvm01nicname" {
  description = "controlMHssandvm01nicname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "enable_nic_ip_forwarding" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "enable_nic_accelerated_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "VM01nicIpConfigName" {
  description = "VM01nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ControlMHssandvm01Name" {
  description = "ControlMHssandvm01Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
######### golden image #####
variable "ImageRGname" {
  description = "ImageRGname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "Imagegalleryname" {
  description = "Imagegalleryname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "Imagename" {
  description = "Imagename"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ImageVersion" {
  description = "ImageVersion"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

###########
variable "ControlMHsvm01osDiskName" {
  description = "ControlMHsvm01osDiskName"
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
variable "ControlMHssandVnetName" {
  description = "ControlMHssandVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ControlMHssandSubnetName" {
  description = "ControlMHssandSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ControlMHssandNetworkingRgName" {
  description = "ControlMHssandNetworkingRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "controlMHsKvName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "ouPath" {
#   description = "ouPath"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "DomainJoinFilePath" {
  description = "script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "adAdminGroup" {
  description = "adAdminGroup name"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "adAdminGroup2" {
  description = "adAdminGroup2 name"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "hostname" {
  description = "hostname name"
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
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

# variable "infraVM_backup_policy_01" {
#   description = "Name of the backup policy which will be applied"
#   default     = ".tmp-rg" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
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
variable "ctrlmHsAdeKvName" {
  description = "ctrlmHsAdeKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ctrlmHsAdeKvRgName" {
  description = "ctrlmHsAdeKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

############ Data Disk #############
variable "pecvmdisks" {
  type = map(object({
    pecvm01diskname = string
    # pecvm02diskname = string
    pecvmrgName = string
    pecdiskSize = string
    pecvm01zone = list(string)
  }))
  description = "Define Azure disks"
  default     = {}
}

variable "pecvm_storage_account_type" {
  type        = string
  description = "pecvm_storage_account_type"
  default     = ""
}

# variable "pecvm01zone" {
#   description = "pecvm01zone"
#   default     = ".tmp "
#   type        = string
# }

variable "ctrlmpecvm01_data_disk" {
  description = "pcenadecvm01_data_disk"
  default     = ".tmp "
  type        = string
}
# variable "ctrlmpecvm02_data_disk" {
#   description = "pcenadecvm01_data_disk"
#   default     = ".tmp "
#   type        = string
# }
variable "disk_lun_01" {
  description = "disk_lun_01"
  default     = ".tmp "
  type        = string
}

variable "caching" {
  description = "caching"
  default     = ".tmp "
  type        = string
}
variable "create_option" {
  type        = string
  description = "create_option"
  default     = ""
}

############## VM02 #######
# variable "ControlMHssandvm02nicname" {
#   description = "controlMHssandvm02nicname"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "VM02nicIpConfigName" {
#   description = "VM02nicIpConfigName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ControlMHssandvm02Name" {
#   description = "ControlMHssandvm02Name"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "ControlMHsvm02osDiskName" {
#   description = "ControlMHsvm02osDiskName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "storageAccountName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
# variable "hostname2" {
#   description = "hostname name"
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
variable "identity_type" {
  description = "identity_type"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
