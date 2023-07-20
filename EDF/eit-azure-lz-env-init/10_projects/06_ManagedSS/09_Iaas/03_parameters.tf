######### EMERSON Variables #############
variable "lzmanagedSsEmersonRgName" {
  description = "lzmanagedSsEmersonRgName"
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

variable "emersonSubnetName" {
  description = "emersonSubnetName"
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

####################### EPONA Variables ################


variable "lzmanagedSsEponaRgName" {
  description = "lzmanagedSsEponaRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "EponaVM01nicName" {
  description = "EponaVM01nicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "EponaVM01nicIpConfigName" {
  description = "EponaVM01nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "enable_nic_ip_forwarding" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "enable_nic_accelerated_networking" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "EponaavSetname" {
  description = "EponaavSetname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "EponaVM01Name" {
  description = "EponaVM01Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "EponaVMosDiskName" {
  description = "EponaVMosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "EponaVMstorageDiskName" {
  description = "EponaVMstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "EponaSubnetName" {
  description = "EponaSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

####################### Cominod Variables ################

variable "CominodResourceLocation" {
  description = "CominodResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "CominodvmRgName" {
  description = "CominodvmRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "CominodVM01nicName" {
  description = "CominodVM01nicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "CominodVM01nicIpConfigName" {
  description = "CominodVM01nicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "enable_nic_ip_forwarding_com" {
  description = "enable_nic_ip_forwarding"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "enable_nic_accelerated_networking_com" {
  description = "enable_nic_accelerated_networking"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "CominodavSetname" {
  description = "CominodavSetname"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "CominodVM01Name" {
  description = "CominodVM01Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "CominodVMosDiskName" {
  description = "CominodVMosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "CominodVMstorageDiskName" {
  description = "CominodVMstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "CominodSubnetName" {
  description = "CominodSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

###### VM Backup ######

variable "RSVName" {
  description = "RSVName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "RSVRgName" {
  description = "RSVRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "infraVM_backup_policy" {
  description = "infraVM_backup_policy"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
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

variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  default     = ""
}
