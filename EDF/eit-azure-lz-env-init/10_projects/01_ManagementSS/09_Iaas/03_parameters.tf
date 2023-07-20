variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

########pki resource group
variable "lzmanagementSsPkiRgName" {
  description = "lzmanagementSsPkiRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

###########pki location
variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

###########managementSs key vault
variable "managementSsKvName" {
  description = "managementSsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managementSsKvRgName" {
  description = "managementSsKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

##########pki Networking
variable "pkiSubnetName" {
  description = "pkiSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagementSsVnetName" {
  description = "lzmanagementSsVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "lzmanagementSsNetworkingRgName" {
  description = "lzmanagementSsNetworkingRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ouPath" {
  description = "ouPath"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
}

variable "gbRegionXmlFilePath" {
  description = "gbRegionXmlFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "prepVmPs1FilePath" {
  description = "prepVmPs1FilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "lapsFilePath" {
  description = "lapsFilePath"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "storageAccountName" {
  description = "storageAccountName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "saContainerName" {
  description = "container name"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

######## Wac Variables##################

variable "lzmanagementSsWacRgName" {
  description = "lzmanagementSsWacRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "wacSubnetName" {
  description = "wacSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

######## WARP Variables #############

variable "lzmanagementSsWarpRgName" {
  description = "lzmanagementSsWarpRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "warpSubnetName" {
  description = "warpSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagementSsWarpLinuxVMsRgName" {
  description = "LinuxtestvmRG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
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

variable "managementSsAdeKvName" {
  description = "managementSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "managementSsAdeKvRgName" {
  description = "managementSsSaRgName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
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

variable "updateManagmentRgName" {
  description = "updateManagmentRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "laWorkspacename" {
  description = "laWorkspacename"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

########### SS ADO Agent variables ###############################

variable "lzmanagementSsadoagentVMsRgName" {
  description = "adoagentbuildRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "sigalleryname" {
  description = "Shared Image gallery name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "sharedimagedefname" {
  description = "Shared Image definition name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmsssubnetname" {
  description = "vmss subnet Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmssvnetname" {
  description = "vmss vnet Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "vmssvnetrg" {
  description = "vmss vnet RG Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
################### AFS VM #######################
variable "lzmanagementSsAFSRgName" {
  description = "AFS VNet RG Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagementSsAFSVmRgName" {
  description = "AFS Vm RG Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "AFSSubnetName" {
  description = "AFSSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagementSsAFSVnetName" {
  description = "AFSmanagementSsVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}


variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  default     = ""
}

################ADDS Parameters######################

variable "lzmanagementss_adds_resource_group" {
  description = "lzmanagementss_adds_resource_group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "dc03vmnicName" {
  description = "dc03vmnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "dc03vmnicIpConfigName" {
  description = "dc03vmnicIpConfigName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "dc04vmnicName" {
  description = "dc04vmnicName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "dc04vmnicIpConfigName" {
  description = "dc04vmnicIpConfigName"
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

variable "lzmanagementSsdcsubnet" {
  description = "lzmanagementSsdcsubnet"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagementSsaddsasg" {
  description = "lzmanagementSsaddsasg"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzmanagementSsaddsasgrg" {
  description = "lzmanagementSsaddsasgrg"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "dc03vmName" {
  description = "dc03vmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "dc03vmosDiskName" {
  description = "do03vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "dc03vmstorageDiskName" {
  description = "dc03vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "dc04vmName" {
  description = "dc04vmName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "dc04vmosDiskName" {
  description = "do04vmosDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "dc04vmstorageDiskName" {
  description = "dc04vmstorageDiskName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "prepVmPs1FilePathforAD" {
  description = "prepVmPs1FilePathforAD"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "urlConfigureADNextDC" {
  description = "urlConfigureADNextDC"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "scriptfileConfigureADNextDC" {
  description = "scriptfileConfigureADNextDC"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "functionConfigureADNextDC" {
  description = "functionConfigureADNextDC"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "adDomainName" {
  description = "adDomainName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "scriptsstorage" {
  description = "scriptsstorage"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "scriptsstoragerg" {
  description = "scriptsstoragerg"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "recovery_services_vault_rgname" {
  description = "recovery_services_vault_rgname"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "recovery_services_vault_name" {
  description = "recovery_services_vault_name"
  type        = string
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "infraVM_backup_policy_01" {
  description = "infraVM_backup_policy_01"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "infraVM_backup_policy_02" {
  description = "infraVM_backup_policy_02"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
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
