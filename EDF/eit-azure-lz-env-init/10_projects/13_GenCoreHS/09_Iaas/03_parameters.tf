########## AVD VM #####################


variable "lzAVDavVmRgName" {
  description = "lzAVDavVmRgName"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "environment" {
  description = "environment"
  default     = ".tmp" //intentionally kept it to something unrealistic
  type        = string
}

variable "lzAVDavVmResourceLocation" {
  description = "lzAVDavVmResourceLocation"
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

variable "AVDavSubnetName" {
  description = "AVDavSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "lzAVDVnetName" {
  description = "lzAVDVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AVDKvName" {
  description = "AVDKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AVDKvRgName" {
  description = "AVDKvRgName"
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

variable "lzAVDVnetRgName" {
  description = "lzAVDVnetRgName"
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
variable "lzAVDav01Vm" {
  description = "lzAVDav01Vm"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav02Vm" {
  description = "lzAVDav02Vm"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav01Vmdatadisk01" {
  description = "lzAVDav01Vmdatadisk01"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav01Vmdatadisk03" {
  description = "lzAVDav01Vmdatadisk03"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav02Vmdatadisk01" {
  description = "lzAVDav02Vmdatadisk01"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav02Vmdatadisk03" {
  description = "lzAVDav02Vmdatadisk03"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav01Vmdatadisk02" {
  description = "lzAVDav01Vmdatadisk02"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav02Vmdatadisk02" {
  description = "lzAVDav02Vmdatadisk02"
  default     = ".tmp"
  type        = string
}

# variable "storage_account_type" {
#   description = "storage_account_type"
#   default     = ".tmp"
#   type        = string
# }
variable "lzAVDav01Vmdatadisk01size" {
  description = "lzAVDav01Vmdatadisk01size"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav01Vmdatadisk02size" {
  description = "lzAVDav01Vmdatadisk02size"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav01Vmdatadisk03size" {
  description = "lzAVDav01Vmdatadisk03size"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav02Vmdatadisk01size" {
  description = "lzAVDav02Vmdatadisk01size"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav02Vmdatadisk02size" {
  description = "lzAVDav02Vmdatadisk02size"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav02Vmdatadisk03size" {
  description = "lzAVDav02Vmdatadisk03size"
  default     = ".tmp"
  type        = string
}

# variable "create_option" {
#   description = "create_option"
#   default     = ".tmp"
#   type        = string
# }

variable "lzAVDav01Vmdatadisk01LunNumber" {
  description = "lzAVDav01Vmdatadisk01LunNumber"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav01Vmdatadisk02LunNumber" {
  description = "lzAVDav01Vmdatadisk02LunNumber"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav01Vmdatadisk03LunNumber" {
  description = "lzAVDav01Vmdatadisk03LunNumber"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav02Vmdatadisk01LunNumber" {
  description = "lzAVDav02Vmdatadisk01LunNumber"
  default     = ".tmp"
  type        = string
}
variable "lzAVDav02Vmdatadisk02LunNumber" {
  description = "lzAVDav02Vmdatadisk02LunNumber"
  default     = ".tmp"
  type        = string
}

variable "lzAVDav02Vmdatadisk03LunNumber" {
  description = "lzAVDav02Vmdatadisk03LunNumber"
  default     = ".tmp"
  type        = string
}

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

variable "av01NicName" {
  description = "av01NicName"
  default     = ".tmp"
  type        = string
}

variable "av02NicName" {
  description = "av02NicName"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigav01" {
  description = "nicIpConfigav01"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigav02" {
  description = "nicIpConfigav02"
  default     = ".tmp"
  type        = string
}

variable "nicipNameav01" {
  description = "nicIpNameav01"
  default     = ".tmp"
  type        = string
}

variable "nicipNameav02" {
  description = "nicIpNameav02"
  default     = ".tmp"
  type        = string
}

variable "vmav01osDiskName" {
  description = "vmav01osDiskName"
  default     = ".tmp"
  type        = string
}

variable "vmav02osDiskName" {
  description = "nicIpNameav02"
  default     = ".tmp"
  type        = string
}

########################## AVD SCCM ##############################################################################

variable "lzAVDSccmVmRgName" {
  description = "lzAVDSccmVmRgName"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccmVmResourceLocation" {
  description = "lzAVDSccmVmResourceLocation"
  default     = ".tmp "
  type        = string
}
variable "AVDSccmSubnetName" {
  description = "AVDSccmSubnetName"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vm" {
  description = "lzAVDSccm01Vm"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vm" {
  description = "lzAVDSccm02Vm"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk01" {
  description = "lzAVDSccm01Vmdatadisk01"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk02" {
  description = "lzAVDSccm01Vmdatadisk02"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk03" {
  description = "lzAVDSccm01Vmdatadisk03"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk01" {
  description = "lzAVDSccm02Vmdatadisk01"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk02" {
  description = "lzAVDSccm02Vmdatadisk02"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk03" {
  description = "lzAVDSccm02Vmdatadisk03"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk01size" {
  description = "lzAVDSccm01Vmdatadisk01size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk02size" {
  description = "lzAVDSccm01Vmdatadisk02size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk03size" {
  description = "lzAVDSccm01Vmdatadisk03size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk01size" {
  description = "lzAVDSccm02Vmdatadisk01size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk02size" {
  description = "lzAVDSccm02Vmdatadisk02size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk03size" {
  description = "lzAVDSccm02Vmdatadisk03size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk01LunNumber" {
  description = "lzAVDSccm01Vmdatadisk01LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk02LunNumber" {
  description = "lzAVDSccm01Vmdatadisk02LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm01Vmdatadisk03LunNumber" {
  description = "lzAVDSccm01Vmdatadisk03LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk01LunNumber" {
  description = "lzAVDSccm02Vmdatadisk01LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk02LunNumber" {
  description = "lzAVDSccm02Vmdatadisk02LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDSccm02Vmdatadisk03LunNumber" {
  description = "lzAVDSccm02Vmdatadisk03LunNumber"
  default     = ".tmp "
  type        = string
}

variable "sccm01NicName" {
  description = "sccm01NicName"
  default     = ".tmp"
  type        = string
}

variable "sccm02NicName" {
  description = "sccm02NicName"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigsccm01" {
  description = "nicIpConfigsccm01"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigsccm02" {
  description = "nicIpConfigsccm02"
  default     = ".tmp"
  type        = string
}

variable "nicipNamesccm01" {
  description = "nicIpNamesccm01"
  default     = ".tmp"
  type        = string
}

variable "nicipNamesccm02" {
  description = "nicIpNamesccm02"
  default     = ".tmp"
  type        = string
}

variable "vmsccm01osDiskName" {
  description = "vmsccm01osDiskName"
  default     = ".tmp"
  type        = string
}

variable "vmsccm02osDiskName" {
  description = "nicIpNamesccm02"
  default     = ".tmp"
  type        = string
}

######################## AVD AD #######################################


variable "lzAVDaddsVmRgName" {
  description = "lzAVDaddsVmRgName"
  default     = ".tmp "
  type        = string
}
variable "lzAVDaddsVmResourceLocation" {
  description = "lzAVDaddsVmResourceLocation"
  default     = ".tmp "
  type        = string
}
variable "AVDaddsSubnetName" {
  description = "AVDaddsSubnetName"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vm" {
  description = "lzAVDadds01Vm"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vm" {
  description = "lzAVDadds02Vm"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk01" {
  description = "lzAVDadds01Vmdatadisk01"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk02" {
  description = "lzAVDadds01Vmdatadisk02"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk03" {
  description = "lzAVDadds01Vmdatadisk03"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk01" {
  description = "lzAVDadds02Vmdatadisk01"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk02" {
  description = "lzAVDadds02Vmdatadisk02"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk03" {
  description = "lzAVDadds02Vmdatadisk03"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk01size" {
  description = "lzAVDadds01Vmdatadisk01size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk02size" {
  description = "lzAVDadds01Vmdatadisk02size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk03size" {
  description = "lzAVDadds01Vmdatadisk03size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk01size" {
  description = "lzAVDadds02Vmdatadisk01size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk02size" {
  description = "lzAVDadds02Vmdatadisk02size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk03size" {
  description = "lzAVDadds02Vmdatadisk03size"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk01LunNumber" {
  description = "lzAVDadds01Vmdatadisk01LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk02LunNumber" {
  description = "lzAVDadds01Vmdatadisk02LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds01Vmdatadisk03LunNumber" {
  description = "lzAVDadds01Vmdatadisk03LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk01LunNumber" {
  description = "lzAVDadds02Vmdatadisk01LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk02LunNumber" {
  description = "lzAVDadds02Vmdatadisk02LunNumber"
  default     = ".tmp "
  type        = string
}
variable "lzAVDadds02Vmdatadisk03LunNumber" {
  description = "lzAVDadds02Vmdatadisk03LunNumber"
  default     = ".tmp "
  type        = string
}

variable "adds01NicName" {
  description = "adds01NicName"
  default     = ".tmp"
  type        = string
}

variable "adds02NicName" {
  description = "adds02NicName"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigadds01" {
  description = "nicIpConfigadds01"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigadds02" {
  description = "nicIpConfigadds02"
  default     = ".tmp"
  type        = string
}

variable "nicipNameadds01" {
  description = "nicIpNameadds01"
  default     = ".tmp"
  type        = string
}

variable "nicipNameadds02" {
  description = "nicIpNameadds02"
  default     = ".tmp"
  type        = string
}

variable "vmadds01osDiskName" {
  description = "vmadds01osDiskName"
  default     = ".tmp"
  type        = string
}

variable "vmadds02osDiskName" {
  description = "nicIpNameadds02"
  default     = ".tmp"
  type        = string
}

# variable "lzAVDzone02" {
#   description = "lzAVDzone02"
#   default     = ".tmp "
#   type        = string
# }
# variable "lzAVDzone01" {
#   description = "lzAVDzone01"
#   default     = ".tmp "
#   type        = string
# }
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

variable "AVDmanagedHsSecretsKvName" {
  description = "AVDmanagedSsSecretsKvName"
  default     = ".tmp "
  type        = string
}
variable "AVDmanagedHsSecretsKvRgName" {
  description = "AVDmanagedSsSecretsKvRgName"
  default     = ".tmp "
  type        = string
}

########################################################## WSUS VM ########################################################################

variable "lzAVDwsusVmRgName" {
  description = "lzAVDwsusVmRgName"
  default     = ".tmp"
  type        = string
}

variable "lzAVDwsusVmResourceLocation" {
  description = "lzAVDwsusVmResourceLocation"
  default     = ".tmp"
  type        = string
}

variable "AVDwsusSubnetName" {
  description = "AVDwsusSubnetName"
  default     = ".tmp"
  type        = string
}

variable "lzAVDwsus01Vm" {
  description = "lzAVDwsus01Vm"
  default     = ".tmp"
  type        = string
}

variable "wsus01NicName" {
  description = "wsus01NicName"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigwsus01" {
  description = "nicIpConfigwsus01"
  default     = ".tmp"
  type        = string
}

variable "nicipNamewsus01" {
  description = "nicipNamewsus01"
  default     = ".tmp"
  type        = string
}

variable "wsus01vmName" {
  description = "wsus01vmName"
  default     = ".tmp"
  type        = string
}

variable "vmwsus01osDiskName" {
  description = "vmwsus01osDiskName"
  default     = ".tmp"
  type        = string
}

variable "vmstorageDiskName" {
  description = "vmstorageDiskName"
  default     = ".tmp"
  type        = string
}


########################################################## micro VM 1 ########################################################################

variable "lztmrVmRgName" {
  description = "lztmrVmRgName"
  default     = ".tmp"
  type        = string
}

variable "TmrVnetName" {
  description = "TmrVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "TmrVnetRgName" {
  description = "TmrVnetRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "lztmrVmResourceLocation" {
  description = "lztmrVmResourceLocation"
  default     = ".tmp"
  type        = string
}

variable "tmrSubnetName" {
  description = "tmrSubnetName"
  default     = ".tmp"
  type        = string
}

# variable "lzAVDtmr01Vm" {
#   description = "lzAVDtmr01Vm"
#   default     = ".tmp"
#   type        = string
# }

variable "tmr01NicName" {
  description = "tmr01NicName"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigtmr01" {
  description = "nicIpConfigtmr01"
  default     = ".tmp"
  type        = string
}

# variable "nicipNametmr01" {
#   description = "nicipNametmr01"
#   default     = ".tmp"
#   type        = string
# }

variable "tmr01vmName" {
  description = "tmr01vmName"
  default     = ".tmp"
  type        = string
}

variable "vmtmr01osDiskName" {
  description = "vmtmr01osDiskName"
  default     = ".tmp"
  type        = string
}

variable "tmrstorageDiskName1" {
  description = "tmrstorageDiskName1"
  default     = ".tmp"
  type        = string
}

variable "enable_nic_ip_forwarding" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp"
  type        = string
}

variable "enable_nic_accelerated_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp"
  type        = string
}

variable "ImageRGname" {
  description = "ImageRGname"
  default     = ".tmp"
  type        = string
}

variable "Imagegalleryname" {
  description = "Imagegalleryname"
  default     = ".tmp"
  type        = string
}

variable "Imagename" {
  description = "Imagename"
  default     = ".tmp"
  type        = string
}

variable "ImageVersion" {
  description = "ImageVersion"
  default     = ".tmp"
  type        = string
}

variable "tmr01vmsize" {
  description = "tmr01vmsize"
  default     = ".tmp"
  type        = string
}


########################################################## tmr VM 2 ########################################################################


# variable "lzAVDtmr02Vm" {
#   description = "lzAVDtmr02Vm"
#   default     = ".tmp"
#   type        = string
# }

variable "tmr02NicName" {
  description = "tmr02NicName"
  default     = ".tmp"
  type        = string
}

variable "nicIpConfigtmr02" {
  description = "nicIpConfigtmr02"
  default     = ".tmp"
  type        = string
}

# variable "nicipNametmr02" {
#   description = "nicipNametmr02"
#   default     = ".tmp"
#   type        = string
# }

variable "tmr02vmName" {
  description = "tmr02vmName"
  default     = ".tmp"
  type        = string
}

variable "vmtmr02osDiskName" {
  description = "vmtmr02osDiskName"
  default     = ".tmp"
  type        = string
}

variable "tmrstorageDiskName2" {
  description = "tmrstorageDiskName2"
  default     = ".tmp"
  type        = string
}

variable "ImageRGnamevm2" {
  description = "ImageRGnamevm2"
  default     = ".tmp"
  type        = string
}

variable "Imagegallerynamevm2" {
  description = "Imagegallerynamevm2"
  default     = ".tmp"
  type        = string
}

variable "Imagenamevm2" {
  description = "Imagenamevm2"
  default     = ".tmp"
  type        = string
}

variable "ImageVersionvm2" {
  description = "ImageVersionvm2"
  default     = ".tmp"
  type        = string
}

variable "tmr02vmsize" {
  description = "tmr02vmsize"
  default     = ".tmp"
  type        = string
}

# variable "isDC" {
#   description = "Type of the VM whether it's DC01,DC02 or NonDC"
#   type        = bool
#   default     = false //intentionally kept it to something unrealistic
# }
variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
