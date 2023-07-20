########## AVD VM #####################


variable "dtgwVmRgName" {
  description = "dtgwVmRgName "
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "environment" {
  description = "environment"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "dtgwVmResourceLocation" {
  description = "dtgwVmResourceLocation"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "storageAccountName" {
  description = "storageAccountName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
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

variable "dtgwvnetName" {
  description = "dtgwvnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "dtgwSubnetName" {
  description = "dtgwSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ADEKvName" {
  description = "ADEKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ADEKvRgName" {
  description = "ADEKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}



variable "saContainerName" {
  description = "saContainerName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

# variable "laWorkspacename" {
#   description = "laWorkspacename"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "laRgName" {
#   description = "laRgName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "EncryptionOperation" {
  description = "EncryptionOperation"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}


variable "KeyEncryptionAlgorithm" {
  description = "KeyEncryptionAlgorithm"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageAccountRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageAccountName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "dtgwVnetRgName" {
  description = "dtgwVnetRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "VolumeType" {
  description = "VolumeType"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}


###########################################################


# variable "lzAVDavVmRgLocation" {
#   description = "lzAVDavVmRgLocation"
#   default     = ".tmp"
#   type        = string
# }
variable "dtgw01Vm" {
  description = "dtgw01Vm"
  default     = ".tmp"
  type        = string
}

variable "dtgw02Vm" {
  description = "dtgw02Vm"
  default     = ".tmp"
  type        = string
}
variable "dtgw01Vmdatadisk01" {
  description = "dtgw01Vmdatadisk01"
  default     = ".tmp"
  type        = string
}
# variable "dtgw01Vmdatadisk03" {
#   description = "dtgw01Vmdatadisk03"
#   default     = ".tmp"
#   type        = string
# }
variable "dtgw02Vmdatadisk01" {
  description = "dtgw02Vmdatadisk01"
  default     = ".tmp"
  type        = string
}
# variable "dtgw02Vmdatadisk03" {
#   description = "dtgw02Vmdatadisk03"
#   default     = ".tmp"
#   type        = string
# }
# variable "dtgw01Vmdatadisk02" {
#   description = "dtgw01Vmdatadisk02"
#   default     = ".tmp"
#   type        = string
# }
# variable "dtgw02Vmdatadisk02" {
#   description = "dtgw02Vmdatadisk02"
#   default     = ".tmp"
#   type        = string
# }

# variable "storage_account_type" {
#   description = "storage_account_type"
#   default     = ".tmp"
#   type        = string
# }
variable "dtgw01Vmdatadisk01size" {
  description = "dtgw01Vmdatadisk01size"
  default     = ".tmp"
  type        = string
}

# variable "dtgw01Vmdatadisk02size" {
#   description = "dtgw01Vmdatadisk02size"
#   default     = ".tmp"
#   type        = string
# }

# variable "dtgw01Vmdatadisk03size" {
#   description = "dtgw01Vmdatadisk03size"
#   default     = ".tmp"
#   type        = string
# }

variable "dtgw02Vmdatadisk01size" {
  description = "dtgw02Vmdatadisk01size"
  default     = ".tmp"
  type        = string
}

# variable "dtgw02Vmdatadisk02size" {
#   description = "dtgw02Vmdatadisk02size"
#   default     = ".tmp"
#   type        = string
# }
# variable "dtgw02Vmdatadisk03size" {
#   description = "dtgw02Vmdatadisk03size"
#   default     = ".tmp"
#   type        = string
# }

# variable "create_option" {
#   description = "create_option"
#   default     = ".tmp"
#   type        = string
# }

variable "dtgw01Vmdatadisk01LunNumber" {
  description = "dtgw01Vmdatadisk01LunNumber"
  default     = ".tmp"
  type        = string
}
# variable "dtgw01Vmdatadisk02LunNumber" {
#   description = "dtgw01Vmdatadisk02LunNumber"
#   default     = ".tmp"
#   type        = string
# }

# variable "dtgw01Vmdatadisk03LunNumber" {
#   description = "dtgw01Vmdatadisk03LunNumber"
#   default     = ".tmp"
#   type        = string
# }

variable "dtgw02Vmdatadisk01LunNumber" {
  description = "dtgw02Vmdatadisk01LunNumber"
  default     = ".tmp"
  type        = string
}
# variable "dtgw02Vmdatadisk02LunNumber" {
#   description = "dtgw02Vmdatadisk02LunNumber"
#   default     = ".tmp"
#   type        = string
# }

# variable "dtgw02Vmdatadisk03LunNumber" {
#   description = "dtgw02Vmdatadisk03LunNumber"
#   default     = ".tmp"
#   type        = string
# }

# variable "lzAVDavVmzone" {
#   description = "lzAVDavVmzone"
#   default     = ".tmp "
#   type        = string
# }

# variable "caching" {
#   description = "caching"
#   default     = ".tmp "
#   type        = string
# }

# variable "vm_id" {
#   description = "vm_id"
#   default     = ".tmp "
#   type        = string
# }

variable "dtgwvm01" {
  description = "dtgwvm01"
  default     = ".tmp"
  type        = string
}

variable "dtgwvm02" {
  description = "dtgwvm02"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigdtgw01" {
  description = "nicIpConfigdtgw01"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigdtgw02" {
  description = "nicIpConfigdtgw02"
  default     = ".tmp"
  type        = string
}

variable "nicipNamedtgw01" {
  description = "nicipNamedtgw01"
  default     = ".tmp"
  type        = string
}

variable "nicipNamedtgw02" {
  description = "nicipNamedtgw02"
  default     = ".tmp"
  type        = string
}

variable "dtgw01osDiskName" {
  description = "dtgw01osDiskName"
  default     = ".tmp"
  type        = string
}

variable "dtgw02osDiskName" {
  description = "nicipNamedtgw02"
  default     = ".tmp"
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
variable "infraVM_backup_policy" {
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

variable "KvName" {
  description = "AVDmanagedSsSecretsKvName"
  default     = ".tmp "
  type        = string
}
variable "KvRgName" {
  description = "AVDmanagedSsSecretsKvRgName"
  default     = ".tmp "
  type        = string
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
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
