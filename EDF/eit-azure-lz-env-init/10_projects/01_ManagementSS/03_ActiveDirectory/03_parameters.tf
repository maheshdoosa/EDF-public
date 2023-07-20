
#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#managementSs key vault
variable "managementSsKvName" {
  description = "managementSsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managementSsKvRgName" {
  description = "managementSsKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "location" {
  description = "resource location"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "adminPassword" {
  description = "password name"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "adminUserName" {
  description = "user name"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "adDomainName" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "dnsServers" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "rootDc1IpAddress" {
  description = "Alternate DNS IP"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "publisher" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "scriptPathPrepareVm" {
  description = "This url is where the ps file is located" //subject to change
  default     = ".tmp-dev"                                 //intentionally kept it to something unrealistic
}

variable "scriptFilePrepareVm" {
  description = "scriptFilePrepareVm" //subject to change
  default     = ".tmp-dev"            //intentionally kept it to something unrealistic
}

variable "dnsForwarder" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "urlCreateAdRootDc1" {
  description = "This is the url to download the DSC files" //subject to change
  default     = ".tmp-dev"                                  //intentionally kept it to something unrealistic
}

variable "createADRootDC1" {
  description = "This is the ps script"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "createFunctionAdRootDc1" {
  description = "This is the ps function"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "additionalTags" {
  type        = map(string)
  description = "Additional tags to be enforced"
  default     = {}
}

variable "ad1vmId" {
  description = "vmId"
  default     = {}
}

variable "ad2vmId" {
  description = "vmId"
  default     = {}
}

variable "blobSas" {
  description = "blobSas"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "storageAccountKey" {
  description = "storageAccountKey"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "storageAccountName" {
  description = "storageAccountName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "saContainerName" {
  description = "saContainerName"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "urlConfigureADNextDC" {
  description = "This is the url to download the DSC files" //subject to change
  default     = ".tmp-dev"                                  //intentionally kept it to something unrealistic
}

variable "ConfigureADNextDC" {
  description = "This is the ps script"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "createFunctionAdRootDc2" {
  description = "This is the ps function"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "PrepareVMForAD" {
  description = "This is the powershell file to rename/format the disks"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "managementSsSaRgName" {
  description = "managementSsSaRgName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
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

variable "DSC01protected_settings" {
  description = "type of the DC VM protected settings"
  default     = null
}

variable "DSC02protected_settings" {
  description = "type of the DC VM protected settings"
  default     = null
}

variable "DSC01settings" {
  description = "Settings properties of DC VM"
  default     = null //intentionally kept it to something unrealistic
}

variable "DSC02settings" {
  description = "Settings properties of DC VM"
  default     = null //intentionally kept it to something unrealistic
}

variable "isDC" {
  description = "Type of the VM whether it's DC01,DC02 or NonDC"
  type        = bool
  default     = false //intentionally kept it to something unrealistic
}

variable "PrepVMsettings" {
  description = "Settings properties of prep vm"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "InstallIaaSAntiMalwareDC" {
  description = "To define whether to install the AntiMalware on DC or Regular servers"
  type        = bool
  default     = false //intentionally kept it to something unrealistic
}

variable "commandToExecute" {
  description = "Command to execute"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

#wsus Networking
variable "addsSubnetName" {
  description = "addsSubnetName"
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

######### boot diag SA logs variable###################

variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
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
