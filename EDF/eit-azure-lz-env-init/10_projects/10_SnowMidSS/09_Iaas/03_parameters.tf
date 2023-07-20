######### Secgov Variables #############
variable "lzmanagedSssecgovRgName" {
  description = "lzmanagedSsSecgovRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

# location
variable "lzHubManagedResourceLocation" {
  description = "lzHubManagedResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

########### Newly added variables #########
variable "eamnicName" {
  description = "eamnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "eamnicName02" {
  description = "eamnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "nicIpConfigName" {
  description = "nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "nicIpConfigName02" {
  description = "nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "nicipName" {
  description = "nicipName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "nicipName02" {
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
variable "eamvmName02" {
  description = "eamvmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmosDiskName" {
  description = "vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "vmosDiskName02" {
  description = "vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmstorageDiskName" {
  description = "vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "vmstorageDiskName02" {
  description = "vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#################

variable "storageAccountName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "saContainerName" {
  description = "extension script"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

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

variable "SecgovSubnetName" {
  description = "SecgovSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagedSsNetworkingRgName" {
  description = "vnet Rg name "
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "managedSsKvName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "managementSsKvRgName" {
  description = "key vault name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "gbRegionXmlFilePath" {
  description = "script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "prepVmPs1FilePath" {
  description = "PS1 script file path"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lapsFilePath" {
  description = "lapsFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

##################### Extensions #######################

variable "MSMonitoringAgent" {
  description = "Type of VM extension to be installed"
  type        = bool
  default     = false //intentionally kept it to something unrealistic
}

variable "MSDependencyAgent" {
  description = "Type of VM extension to be installed"
  type        = bool
  default     = false //intentionally kept it to something unrealistic
}

variable "MSNetworkWatcher" {
  description = "Type of VM extension to be installed"
  type        = bool
  default     = false //intentionally kept it to something unrealistic
}

variable "LAprotected_settings" {
  description = "primary_shared_key of Log Analytics "
  default     = null //intentionally kept it to something unrealistic
}

variable "LAsettings" {
  description = "workspace_id of Disk Encryption"
  default     = null //intentionally kept it to something unrealistic
}

################### Azure Disk Encryption ###################

variable "KeyEncryptionAlgorithm" {
  description = "KeyEncryptionAlgorithm"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "EncryptionOperation" {
  description = "EncryptionOperation"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "VolumeType" {
  description = "VolumeType"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "managedSsAdeKvName" {
  description = "managedSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "managedSsAdeKvRgName" {
  description = "managedSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

######### RecoveryServiceVault ############

variable "rsv_resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "recovery_vault_name" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "infraVM_backup_policy" {
  description = "Name of the backup policy which will be applied"
  default     = ""
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ""
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



variable "lzmanagedSssecgovtenableRgName" {
  description = "lzmanagedSssecgovtenableRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "tenablenicName" {
  description = "tenablenicName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "tenableSubnetName" {
  description = "tenableSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "tenablenicIpConfigName" {
  description = "tenablenicIpConfigName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "sssecgov03PrivateIpAddress" {
  description = "sssecgov03PrivateIpAddress"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "tenablevmname" {
  description = "tenablevmname"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "bootDiagLogtenableStorageAccountName" {
  description = "bootDiagLogtenableStorageAccountName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}
variable "bootDiagLogtenableStorageAccountRgName" {
  description = "bootDiagLogtenableStorageAccountRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
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
variable "diskSize" {
  type        = string
  description = "diskSize"
  default     = ""
}

variable "lztenablezone" {
  description = "lztenablezone"
  default     = ".tmp "
}

variable "caching" {
  description = "caching"
  default     = ".tmp "
}

variable "Tenable_data_disk" {
  description = "Tenable_data_disk"
  default     = ".tmp "
}
variable "disk_lun_01" {
  description = "disk_lun_01"
  default     = ".tmp "
}

variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  default     = ""
}
