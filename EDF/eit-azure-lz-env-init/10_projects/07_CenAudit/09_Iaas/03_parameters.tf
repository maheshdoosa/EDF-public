variable "lzcenadtRgName" {
  description = "lzcenadtRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "lzcenadtResourceLocation" {
  description = "lzcenadtResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtvm01nicName" {
  description = "cenadtvm01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "cenadtvm02nicName" {
  description = "cenadtvm02nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtvm01nicIpConfigName" {
  description = "cenadtvm01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "cenadtvm02nicIpConfigName" {
  description = "cenadtvm02nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtvm01name" {
  description = "cenadtvm01name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "cenadtvm02name" {
  description = "cenadtvm02name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "disks" {
  type = map(object({
    vm01diskname = string
    vm02diskname = string
    vmrgName     = string
    diskSize     = string
  }))
  description = "Define Azure disks"
  default     = {}
}
# variable "disks" {
#   type = map(object({
#     vm02diskname = string
#     vmrgName = string
#     diskSize = string
#   }))
#   description = "Define Azure disks"
#   default = {}
# }

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

# variable "lzvm01zone" {
#   description = "lzvm01zone"
#   default     = ".tmp "
#   type        = string
# }
variable "lzvm02zone" {
  description = "lzvm02zone"
  default     = [".tmp "]
  type        = list(string)
}

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
variable "cenadtSubnetName" {
  description = "cenadtSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "cenadtVnetName" {
  description = "vnet name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "cenadtNetworkingRgName" {
  description = "vnet Rg name "
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageAccountName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageAccountRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
# variable "cenadvm01_data_disk" {
#   description = "cenadvm01_data_disk"
#   default     = ".tmp "
#   type        = string
# }
variable "cenadvm02_data_disk" {
  description = "cenadvm02_data_disk"
  default     = ".tmp "
  type        = string
}
# variable "cenadtvm01PrivateIpAddress" {
#   description = "cenadtvm01PrivateIpAddress"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }
# variable "cenadtvm02PrivateIpAddress" {
#   description = "cenadtvm02PrivateIpAddress"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

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

variable "DomainJoinFilePath" {
  description = "script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


# variable "ouPath" {
#   description = "ouPath"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }


variable "adAdminGroup" {
  description = "The AD group that needs to be added in sudoers"
  type        = string
}

# variable "adAdminGroup1" {
#   description = "The AD group that needs to be added in sudoers"
#   type        = string
# }

variable "adAdminGroup2" {
  description = "The AD group that needs to be added in sudoers"
  type        = string
}

variable "hostname" {
  description = "The hostname"
  type        = string
}

############  Key Vault ##############
variable "cenadtKvName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "cenadtKvRgName" {
  description = "key vault name"
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

variable "HsAdeKvName" {
  description = "HsAdeKvName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "HsAdeKvRgName" {
  description = "HsAdeKvRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

################# Event Collector ##############

###################### centadtpec VM 01 ##########

variable "lzcenadtpecRgName" {
  description = "lzcenadtpecRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecSubnetName" {
  description = "cenadtpecSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm01nicName" {
  description = "cenadtpecvm01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm02nicName" {
  description = "cenadtpecvm01nicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm01nicIpConfigName" {
  description = "cenadtpecvm01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm02nicIpConfigName" {
  description = "cenadtpecvm01nicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "enable_nic_ip_forwarding" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "enable_nic_accelerated_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm01name" {
  description = "cenadtpecvm01name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm01_ImageRGname" {
  description = "pecvm01_ImageRGname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm01_Imagegalleryname" {
  description = "pecvm01_Imagegalleryname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm01_Imagename" {
  description = "pecvm01_Imagename"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm01_ImageVersion" {
  description = "pecvm01_ImageVersion"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm01size" {
  description = "cenadtpecvm01size"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm01osdiskname" {
  description = "cenadtpecvm01osdiskname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storageOsDiskCreateOption" {
  description = "storageOsDiskCreateOption"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storageOsDiskCaching" {
  description = "storageOsDiskCaching"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "osdisksize" {
  description = "osdisksize"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "osDisktype" {
  description = "osDisktype"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "hostname_epcvm01" {
  description = "hostname_epcvm01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


############ Data Disk #############

variable "pecvmdisks" {
  type = map(object({
    pecvm01diskname = string
    pecvmrgName     = string
    pecdiskSize     = string
  }))
  description = "Define Azure disks"
  default     = {}
}

variable "pecvm_storage_account_type" {
  type        = string
  description = "pecvm_storage_account_type"
  default     = ""
}

variable "pecvm01zone" {
  description = "pecvm01zone"
  default     = [".tmp "]
  type        = list(string)
}

variable "cenadpecvm01_data_disk" {
  description = "pcenadecvm01_data_disk"
  default     = ".tmp "
  type        = string
}

###################### centadtpec VM 02 ##########

variable "cenadtpecvm02name" {
  description = "cenadtpecvm01name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm02_ImageRGname" {
  description = "pecvm01_ImageRGname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm02_Imagegalleryname" {
  description = "pecvm01_Imagegalleryname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm02_Imagename" {
  description = "pecvm01_Imagename"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "pecvm02_ImageVersion" {
  description = "pecvm01_ImageVersion"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm02size" {
  description = "cenadtpecvm01size"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtpecvm02osdiskname" {
  description = "cenadtpecvm01osdiskname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDiskCaching" {
  description = "storagedataDiskCaching"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDiskCreateOption" {
  description = "storagedataDiskCreateOption"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDiskType" {
  description = "storagedataDiskType"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDisksize" {
  description = "storagedataDisksize"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDiskName" {
  description = "storagedataDiskName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "storagedataDisklun" {
  description = "storagedataDisklun"
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

variable "ouPath_windows" {
  description = "ouPath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


variable "rsv_resourceGroupName" {
  description = "rsv_resourceGroupName"
  default     = ".tmp "
  type        = string
}
variable "recovery_vault_name" {
  description = "recovery_vault_name"
  default     = ".tmp "
  type        = string
}
variable "infraVM_backup_policy_01" {
  description = "infraVM_backup_policy"
  default     = ".tmp "
  type        = string
}
variable "infraVM_backup_policy_02" {
  description = "infraVM_backup_policy_02"
  default     = ".tmp "
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
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
