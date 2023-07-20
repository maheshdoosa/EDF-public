variable "eitmngdhsResourceLocation" {
  description = "eitmngdhsResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "mimdbvmRgName" {
  description = "mimdbvm01RgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvmRgName" {
  description = "mimdbvm01RgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "scriptsstorageAccountName" {
  description = "scriptsstorageAccountName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "saContainerName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "eitmngdHssecretsKvName" {
  description = "eitmngdHsKvName"
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

##########  MIM VM's NIC #########################

variable "eitmngdHsVnetName" {
  description = "eitmngdHsVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "eitmngdHsNetworkingRgName" {
  description = "eitmngdHsNetworkingRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


variable "MIMAPPSubnetName" {
  description = "MIMAPPSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "MIMDBSubnetName" {
  description = "MIMDBSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01nicName" {
  description = "mimdbvm01nicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01nicName" {
  description = "mimappvm01nicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02nicName" {
  description = "mimappvm02nicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01nicIpConfigName" {
  description = "mimdbvm01nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01nicIpConfigName" {
  description = "mimappvm01nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02nicIpConfigName" {
  description = "mimappvm02nicIpConfigName"
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

############ MIM VM ###############

variable "mimdbvm01name" {
  description = "mimdbvm01name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01name" {
  description = "mimdbvm01name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02name" {
  description = "mimdbvm01name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


variable "mimdbvm01size" {
  description = "mimdbvm01size"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01size" {
  description = "mimdbvm01size"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02size" {
  description = "mimdbvm01size"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01osdiskname" {
  description = "mimdbvm01osdiskname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01osdiskname" {
  description = "mimdbvm01osdiskname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02osdiskname" {
  description = "mimdbvm01osdiskname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "storageOsDiskCreateOption" {
  description = "storageOsDiskCreateOption"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "storageOsDiskCaching" {
  description = "storageOsDiskCaching"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDiskCaching" {
  description = "storagedataDiskCaching"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "storagedataDiskCreateOption" {
  description = "storagedataDiskCreateOption"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDiskType" {
  description = "storagedataDiskType"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk1Name" {
  description = "mimdbvm01_storagedataDisk1Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk1size" {
  description = "mimdbvm01_storagedataDisk1size"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk1lun" {
  description = "mimdbvm01_storagedataDisk1lun"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk2Name" {
  description = "mimdbvm01_storagedataDisk2Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk2size" {
  description = "mimdbvm01_storagedataDisk2size"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk2lun" {
  description = "mimdbvm01_storagedataDisk2lun"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk3Name" {
  description = "mimdbvm01_storagedataDisk3Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk3size" {
  description = "mimdbvm01_storagedataDisk3size"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimdbvm01_storagedataDisk3lun" {
  description = "mimdbvm01_storagedataDisk3lun"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01_storagedataDiskName" {
  description = "mimappvm01_storagedataDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01_storagedataDisksize" {
  description = "mimappvm01_storagedataDisksize"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm01_storagedataDisklun" {
  description = "mimdbvm01_storagedataDisk3lun"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02_storagedataDiskName" {
  description = "mimappvm01_storagedataDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02_storagedataDisksize" {
  description = "mimappvm01_storagedataDisksize"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "mimappvm02_storagedataDisklun" {
  description = "mimdbvm01_storagedataDisk3lun"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "mimdbvm01_storagedataDisksize" {
#   description = "storagedataDisksize"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type = string
# }

# variable "mimdbvm01_storagedataDiskName" {
#   description = "storagedataDiskName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "mimdbvm01_storagedataDisklun" {
#   description = "storagedataDisklun"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "mimappvm01_storagedataDisksize" {
#   description = "storagedataDisksize"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "mimappvm01_storagedataDiskName" {
#   description = "storagedataDiskName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "mimappvm01_storagedataDisklun" {
#   description = "storagedataDisklun"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "mimappvm02_storagedataDisksize" {
#   description = "storagedataDisksize"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "mimappvm02_storagedataDiskName" {
#   description = "storagedataDiskName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "mimappvm02_storagedataDisklun" {
#   description = "storagedataDisklun"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }


variable "ouPath_windows" {
  description = "ouPath_windows"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

######### golden image #####
variable "eitmngdhs_ImageRGname" {
  description = "eitmngdhs_ImageRGname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "eitmngdhs_Imagegalleryname" {
  description = "eitmngdhs_Imagegalleryname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "eitmngdhs_Imagename" {
  description = "eitmngdhs_Imagename"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "eitmngdhs_ImageVersion" {
  description = "eitmngdhs_ImageVersion"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
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
variable "eitHsmngdAdeKvName" {
  description = "ctrlmHsAdeKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "eitHsmngdAdeKvRgName" {
  description = "ctrlmHsAdeKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "gbRegionXmlFilePath" {
  description = "gbRegionXmlFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "prepVmPs1FilePath" {
  description = "prepVmPs1FilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "lapsFilePath" {
  description = "lapsFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

############## Backup For MIM VM's################

variable "recovery_services_vault_rgname" {
  description = "recovery_services_vault_rgname"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
  type        = string
}

variable "recovery_services_vault_name" {
  description = "recovery_vault_name"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "infraVM_backup_policy_01" {
  description = "infraVM_backup_policy_01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "infraVM_backup_policy_02" {
  description = "infraVM_backup_policy_02"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "vm_name" {
  description = "(Optional) sku of the resource"
  type = map(object({
    recovery_services_vault_name   = string,
    recovery_services_vault_rgname = string,
    vm_id                          = string,
    policy_id                      = string
  }))
}
