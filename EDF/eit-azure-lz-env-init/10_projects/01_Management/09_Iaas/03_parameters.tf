# variable "environment" {
#   description = "environment"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

#pki resource group
variable "lzmanagementHsPkiRgName" {
  description = "lzmanagementHsPkiRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsWacRgName" {
  description = "lzmanagementHsWacRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsDc03RgName" {
  description = "lzmanagementHsDc03RgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
#pki location
variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#managementHs key vault
variable "managementHsKvName" {
  description = "managementHsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

# variable "managementHsKvRgName" {
#   description = "managementHsKvRgName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
#   type        = string
# }

#wpki Networking
variable "pkiSubnetName" {
  description = "pkiSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "wacSubnetName" {
  description = "wacSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dcSubnetName" {
  description = "dcSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsVnetName" {
  description = "lzmanagementHsVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsNetworkingRgName" {
  description = "lzmanagementHsNetworkingRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "ouPathDc" {
  description = "ouPathDc"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
  type        = string
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
  type        = string
}


################################ AFS Variables ######################################
variable "lzmanagementHsAFSVmRgName" {
  description = "lzmanagementHsAFSVmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementHsAFSVnetName" {
  description = "lzmanagementHsAFSVnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "lzmanagementHsAFSRgName" {
  description = "lzmanagementHsAFSRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "AFSSubnetName" {
  description = "AFSSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "afshsnic01name" {
  description = "afshsnic01name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "nicIpConfigName" {
  description = "nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "nicipName" {
  description = "nicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "afshsvm01Name" {
  description = "afshsvm01Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmosDiskName" {
  description = "vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "vmstorageDiskName" {
  description = "vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "storageAccountName" {
  description = "storageAccountName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "saContainerName" {
  description = "saContainerName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

################ ADE KV ###################

#managementHs key vault
variable "managementHsAdeKvName" {
  description = "managementHsAdeKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "managementHsAdeKvRgName" {
  description = "managementHsAdeKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

###################### RSV ####################

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
variable "PrepareVMForADPath" {
  description = "PS1 script file path for AD"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  default     = ""
  type        = string
}
# variable "IaaSAntiMalwareDC" {
#   description = "DC Antimalware settings"
#   default     = ""
#   type        = string
# }

############### VM - DC03 Variables ####
variable "dc03vmnicName" {
  description = "dc03vmnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc03vmnicIpConfigName" {
  description = "dc03vmnicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc03vmnicipName" {
  description = "dc03vmnicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc03vmName" {
  description = "dc03vmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "do03vmosDiskName" {
  description = "do03vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc03vmstorageDiskName" {
  description = "dc03vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

############### VM - DC04 Variables ####
variable "dc04vmnicName" {
  description = "dc04vmnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc04vmnicIpConfigName" {
  description = "dc04vmnicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc04vmnicipName" {
  description = "dc04vmnicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc04vmName" {
  description = "dc04vmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "do04vmosDiskName" {
  description = "do04vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc04vmstorageDiskName" {
  description = "dc04vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

#############
variable "lapsFilePath" {
  description = "lapsFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}




############## Ansible Patching VM #############


variable "lzmanagementhsAnsRgName" {
  description = "lzmanagementhsAnsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "ansvmnicName" {
  description = "ansvmnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "AnsvmnicIpConfigName" {
  description = "AnsvmnicIpConfigName"
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
variable "ansvm01name" {
  description = "ansvm01name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
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
variable "ansosDiskName" {
  description = "ansosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "saContainerName-dj" {
  description = "container name"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
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
variable "DomainJoinFilePath" {
  description = "DomainJoinFilePath name"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc01vmName" {
  description = "dc01vmName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "dc02vmName" {
  description = "dc02vmName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "web01vmname" {
  description = "web01vmname"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "web02vmname" {
  description = "web02vmname"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "ica01vmname" {
  description = "ica01vmname"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "ica02vmname" {
  description = "ica02vmname"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "rca01vmname" {
  description = "rca01vmname"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "wac01vmname" {
  description = "wac01vmname"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "wus01vmname" {
  description = "wus01vmname"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementhsweb01RgName" {
  description = "lzmanagementhsweb01RgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementhsica01RgName" {
  description = "lzmanagementhsica01RgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementhswac01RgName" {
  description = "lzmanagementhswac01RgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "lzmanagementhswus01RgName" {
  description = "lzmanagementhswus01RgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "infraVM_backup_policy_01" {
  description = "infraVM_backup_policy_01"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}
variable "recovery_vault_name_02" {
  description = "recovery_vault_name_02"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
  type        = string
}

variable "diagsettingnic" {
  type = list(object({
    nicname = string
    rg      = string
  }))
  default = []
}
