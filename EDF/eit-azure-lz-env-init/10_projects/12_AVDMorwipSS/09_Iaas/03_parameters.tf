########## AVD VM #####################


variable "lzAVDavVmRgName" {
  description = "lzAVDavVmRgName"
  default     = ".tmp" //intentionally kept it to something unrealistic

}

variable "environment" {
  description = "environment"
  default     = ".tmp" //intentionally kept it to something unrealistic

}

variable "lzAVDavVmResourceLocation" {
  description = "lzAVDavVmResourceLocation"
  default     = ".tmp" //intentionally kept it to something unrealistic

}

variable "storageAccountName" {
  description = "storageAccountName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "gbRegionXmlFilePath" {
  description = "gbRegionXmlFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "prepVmPs1FilePath" {
  description = "prepVmPs1FilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AVDavSubnetName" {
  description = "AVDavSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "lzAVDVnetName" {
  description = "lzAVDVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AVDKvName" {
  description = "AVDKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AVDKvRgName" {
  description = "AVDKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}



variable "saContainerName" {
  description = "saContainerName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "laWorkspacename" {
  description = "laWorkspacename"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "laRgName" {
  description = "laRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "EncryptionOperation" {
  description = "EncryptionOperation"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "KeyEncryptionAlgorithm" {
  description = "KeyEncryptionAlgorithm"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageAccountRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageAccountName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "lzAVDVnetRgName" {
  description = "lzAVDVnetRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "VolumeType" {
  description = "VolumeType"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}


###########################################################


variable "lzAVDavVmRgLocation" {
  description = "lzAVDavVmRgLocation"
  default     = ".tmp"

}
variable "lzAVDav01Vm" {
  description = "lzAVDav01Vm"
  default     = ".tmp"

}

variable "lzAVDav02Vm" {
  description = "lzAVDav02Vm"
  default     = ".tmp"

}
variable "lzAVDav01Vmdatadisk01" {
  description = "lzAVDav01Vmdatadisk01"
  default     = ".tmp"

}
variable "lzAVDav01Vmdatadisk03" {
  description = "lzAVDav01Vmdatadisk03"
  default     = ".tmp"

}
variable "lzAVDav02Vmdatadisk01" {
  description = "lzAVDav02Vmdatadisk01"
  default     = ".tmp"

}
variable "lzAVDav02Vmdatadisk03" {
  description = "lzAVDav02Vmdatadisk03"
  default     = ".tmp"

}
variable "lzAVDav01Vmdatadisk02" {
  description = "lzAVDav01Vmdatadisk02"
  default     = ".tmp"

}
variable "lzAVDav02Vmdatadisk02" {
  description = "lzAVDav02Vmdatadisk02"
  default     = ".tmp"

}

variable "storage_account_type" {
  description = "storage_account_type"
  default     = ".tmp"

}
variable "lzAVDav01Vmdatadisk01size" {
  description = "lzAVDav01Vmdatadisk01size"
  default     = ".tmp"

}

variable "lzAVDav01Vmdatadisk02size" {
  description = "lzAVDav01Vmdatadisk02size"
  default     = ".tmp"

}

variable "lzAVDav01Vmdatadisk03size" {
  description = "lzAVDav01Vmdatadisk03size"
  default     = ".tmp"

}

variable "lzAVDav02Vmdatadisk01size" {
  description = "lzAVDav02Vmdatadisk01size"
  default     = ".tmp"

}

variable "lzAVDav02Vmdatadisk02size" {
  description = "lzAVDav02Vmdatadisk02size"
  default     = ".tmp"

}
variable "lzAVDav02Vmdatadisk03size" {
  description = "lzAVDav02Vmdatadisk03size"
  default     = ".tmp"

}

variable "create_option" {
  description = "create_option"
  default     = ".tmp"

}

variable "lzAVDav01Vmdatadisk01LunNumber" {
  description = "lzAVDav01Vmdatadisk01LunNumber"
  default     = ".tmp"

}
variable "lzAVDav01Vmdatadisk02LunNumber" {
  description = "lzAVDav01Vmdatadisk02LunNumber"
  default     = ".tmp"

}

variable "lzAVDav01Vmdatadisk03LunNumber" {
  description = "lzAVDav01Vmdatadisk03LunNumber"
  default     = ".tmp"

}

variable "lzAVDav02Vmdatadisk01LunNumber" {
  description = "lzAVDav02Vmdatadisk01LunNumber"
  default     = ".tmp"

}
variable "lzAVDav02Vmdatadisk02LunNumber" {
  description = "lzAVDav02Vmdatadisk02LunNumber"
  default     = ".tmp"

}

variable "lzAVDav02Vmdatadisk03LunNumber" {
  description = "lzAVDav02Vmdatadisk03LunNumber"
  default     = ".tmp"

}

variable "lzAVDavVmzone" {
  description = "lzAVDavVmzone"
  default     = ".tmp "
}

variable "caching" {
  description = "caching"
  default     = ".tmp "
}

variable "vm_id" {
  description = "vm_id"
  default     = ".tmp "
}

########################## AVD SCCM ##############################################################################

variable "lzAVDSccmVmRgName" {
  description = "lzAVDSccmVmRgName"
  default     = ".tmp "
}
variable "lzAVDSccmVmResourceLocation" {
  description = "lzAVDSccmVmResourceLocation"
  default     = ".tmp "
}
variable "AVDSccmSubnetName" {
  description = "AVDSccmSubnetName"
  default     = ".tmp "
}
variable "lzAVDSccm01Vm" {
  description = "lzAVDSccm01Vm"
  default     = ".tmp "
}
variable "lzAVDSccm02Vm" {
  description = "lzAVDSccm02Vm"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk01" {
  description = "lzAVDSccm01Vmdatadisk01"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk02" {
  description = "lzAVDSccm01Vmdatadisk02"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk03" {
  description = "lzAVDSccm01Vmdatadisk03"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk01" {
  description = "lzAVDSccm02Vmdatadisk01"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk02" {
  description = "lzAVDSccm02Vmdatadisk02"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk03" {
  description = "lzAVDSccm02Vmdatadisk03"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk01size" {
  description = "lzAVDSccm01Vmdatadisk01size"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk02size" {
  description = "lzAVDSccm01Vmdatadisk02size"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk03size" {
  description = "lzAVDSccm01Vmdatadisk03size"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk01size" {
  description = "lzAVDSccm02Vmdatadisk01size"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk02size" {
  description = "lzAVDSccm02Vmdatadisk02size"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk03size" {
  description = "lzAVDSccm02Vmdatadisk03size"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk01LunNumber" {
  description = "lzAVDSccm01Vmdatadisk01LunNumber"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk02LunNumber" {
  description = "lzAVDSccm01Vmdatadisk02LunNumber"
  default     = ".tmp "
}
variable "lzAVDSccm01Vmdatadisk03LunNumber" {
  description = "lzAVDSccm01Vmdatadisk03LunNumber"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk01LunNumber" {
  description = "lzAVDSccm02Vmdatadisk01LunNumber"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk02LunNumber" {
  description = "lzAVDSccm02Vmdatadisk02LunNumber"
  default     = ".tmp "
}
variable "lzAVDSccm02Vmdatadisk03LunNumber" {
  description = "lzAVDSccm02Vmdatadisk03LunNumber"
  default     = ".tmp "
}

######################## AVD AD #######################################


variable "lzAVDaddsVmRgName" {
  description = "lzAVDaddsVmRgName"
  default     = ".tmp "
}
variable "lzAVDaddsVmResourceLocation" {
  description = "lzAVDaddsVmResourceLocation"
  default     = ".tmp "
}
variable "AVDaddsSubnetName" {
  description = "AVDaddsSubnetName"
  default     = ".tmp "
}
variable "lzAVDadds01Vm" {
  description = "lzAVDadds01Vm"
  default     = ".tmp "
}
variable "lzAVDadds02Vm" {
  description = "lzAVDadds02Vm"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk01" {
  description = "lzAVDadds01Vmdatadisk01"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk02" {
  description = "lzAVDadds01Vmdatadisk02"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk03" {
  description = "lzAVDadds01Vmdatadisk03"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk01" {
  description = "lzAVDadds02Vmdatadisk01"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk02" {
  description = "lzAVDadds02Vmdatadisk02"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk03" {
  description = "lzAVDadds02Vmdatadisk03"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk01size" {
  description = "lzAVDadds01Vmdatadisk01size"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk02size" {
  description = "lzAVDadds01Vmdatadisk02size"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk03size" {
  description = "lzAVDadds01Vmdatadisk03size"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk01size" {
  description = "lzAVDadds02Vmdatadisk01size"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk02size" {
  description = "lzAVDadds02Vmdatadisk02size"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk03size" {
  description = "lzAVDadds02Vmdatadisk03size"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk01LunNumber" {
  description = "lzAVDadds01Vmdatadisk01LunNumber"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk02LunNumber" {
  description = "lzAVDadds01Vmdatadisk02LunNumber"
  default     = ".tmp "
}
variable "lzAVDadds01Vmdatadisk03LunNumber" {
  description = "lzAVDadds01Vmdatadisk03LunNumber"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk01LunNumber" {
  description = "lzAVDadds02Vmdatadisk01LunNumber"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk02LunNumber" {
  description = "lzAVDadds02Vmdatadisk02LunNumber"
  default     = ".tmp "
}
variable "lzAVDadds02Vmdatadisk03LunNumber" {
  description = "lzAVDadds02Vmdatadisk03LunNumber"
  default     = ".tmp "
}
variable "lzAVDzone02" {
  description = "lzAVDzone02"
  default     = ".tmp "
}
variable "lzAVDzone01" {
  description = "lzAVDzone01"
  default     = ".tmp "
}
variable "rsv_resourceGroupName" {
  description = "rsv_resourceGroupName"
  default     = ".tmp "
}
variable "recovery_vault_name" {
  description = "recovery_vault_name"
  default     = ".tmp "
}
variable "infraVM_backup_policy" {
  description = "infraVM_backup_policy"
  default     = ".tmp "
}
variable "infraVM_backup_policy_02" {
  description = "infraVM_backup_policy_02"
  default     = ".tmp "
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

variable "AVDmanagedSsSecretsKvName" {
  description = "AVDmanagedSsSecretsKvName"
  default     = ".tmp "
}
variable "AVDmanagedSsSecretsKvRgName" {
  description = "AVDmanagedSsSecretsKvRgName"
  default     = ".tmp "
}

variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  default     = ""
}
