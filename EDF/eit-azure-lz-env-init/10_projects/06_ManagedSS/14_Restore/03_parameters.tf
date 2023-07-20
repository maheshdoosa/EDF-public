variable "lzmanagedSsEmerson_resourceLocation" {
  description = "resourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsEmerson_rsvName" {
  description = "recoveryservice_VaultName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsEmerson_rsvrgname" {
  description = "recoveryservice_rgname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsEmerson_vmname" {
  description = "name of VM to be restore"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}


variable "lzmanagedSsEmerson_storageAccountName" {
  description = "storageAccountName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsEmerson_vmrestoreRgName" {
  description = "lzmanagedSsEmerson_vmrestoreRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsEmerson_vmrestoretargetRgName" {
  description = "targetResourceGroupName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsEmerson_newdiskName" {
  description = "newDiskname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "managedSsKvName" {
  description = "managedSsKvName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "managedSsKvRgName" {
  description = "managedSsKvRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "managementHsSaRgName" {
  description = "managementHsSaRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "managementHsSaName" {
  description = "managementHsSaName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

############## VM ##############


variable "eamnicName" {
  description = "eamnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "nicIpConfigName" {
  description = "nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "nicipName" {
  description = "nicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "avSetname" {
  description = "avSetname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "eamvmName" {
  description = "eamvmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmosDiskName" {
  description = "vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmstorageDiskName" {
  description = "vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#################


variable "bootDiagLogStorageAccountName" {
  description = "boot diagnostics logs storage account name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "bootDiagLogStorageAccountRgName" {
  description = "boot diagnostics logs storage Rg name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "storageAccountKey" {
  description = "Storage account access key"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsVnetName" {
  description = "vnet name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "emersonSubnetName" {
  description = "emersonSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsNetworkingRgName" {
  description = "vnet Rg name "
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

########## Restore data Disk #########

variable "lzmanagedSsEmerson_newdiskName_r" {
  description = "newDiskname-Restored"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}


variable "vmstorageDiskName_r" {
  description = "vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
