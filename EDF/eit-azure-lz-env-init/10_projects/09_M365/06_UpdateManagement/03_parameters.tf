variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "updateManagmentRgName" {
  description = "updateManagmentRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "updateManagmentRgLocation" {
  description = "updateManagmentRgLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "laWorkspacename" {
  description = "laWorkspacename"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "automationAccountName" {
  description = "automationAccountName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "automationAccountSku" {
  description = "automationAccountSku"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic

}

variable "laWorkspaceSku" {
  description = "laWorkspaceSku"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic

}

variable "lawSolutionName" {
  description = "laWorkspaceSku"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic

}

######################### WSUS parameters ########################

#managementHs key vault
variable "managementSsKvName" {
  description = "managementSsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managementSsKvRgName" {
  description = "managementSsKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#wsus Resource Group Name
variable "wsusRgName" {
  description = "wsusRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#wsus Resource group location
variable "wsusLocation" {
  description = "wsusLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#wsus Networking
variable "wsusSubnetName" {
  description = "wsusSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "lzmanagementSsVnetName" {
  description = "lzmanagementHsVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "lzmanagementSsNetworkingRgName" {
  description = "lzmanagementHsNetworkingRgName"
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

variable "isDC" {
  description = "Type of the VM whether it's DC01,DC02 or NonDC"
  type        = bool
  default     = false //intentionally kept it to something unrealistic
}

variable "IaaSAntiMalwareDC" {
  description = "DC Antimalware settings"
  default     = ""
}

variable "IaaSAntiMalware" {
  description = "Non DC Antimalware settings"
  default     = ""
}

variable "PrepVMprotected_settings" {
  description = "type of the protected settings"
  default     = null
}

variable "PrepVMsettings" {
  description = "Settings properties of prep vm"
  default     = null //intentionally kept it to something unrealistic
}

variable "storageAccountName" {
  description = "storageAccountName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "managementSsSaRgName" {
  description = "managementSsSaRgName"
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

variable "saContainerName" {
  description = "saContainerName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "amplsName" {

  description = "amplsName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
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
