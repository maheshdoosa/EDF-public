#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#managementHs key vault
variable "managementHsKvName" {
  description = "managementHsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managementHsKvRgName" {
  description = "managementHsKvRgName"
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

variable "virtualMachineName1" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "virtualMachineName2" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
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

variable "spSecret" {
  description = "spSecret"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "tenantId" {
  description = "tenantId"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "subscriptionId" {
  description = "subscriptionId"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "spApplicationId" {
  description = "spApplicationId"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
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

variable "managementHsSaRgName" {
  description = "managementHsSaRgName"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "scriptPathCreateOU" {
  description = "This url is where the ps file is located" //subject to change
  default     = ".tmp-dev"                                 //intentionally kept it to something unrealistic
}

variable "oulist" {
  description = "List  of the OUs"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "useroulist" {
  description = "List  of the OUs"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "oupath" {
  description = "OU path"
  default     = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "extname" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "serverOuBlobPrefix" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

variable "userOuBlobPrefix" {
  default = ".tmp-dev" //intentionally kept it to something unrealistic
}

#wsus Networking
variable "addsSubnetName" {
  description = "addsSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "lzmanagementHsVnetName" {
  description = "lzmanagementHsVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "lzmanagementHsNetworkingRgName" {
  description = "lzmanagementHsNetworkingRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
