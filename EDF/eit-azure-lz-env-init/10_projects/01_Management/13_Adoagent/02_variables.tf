########### HS ADO Agent variables ###############################

variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
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


variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
}

variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealis
}

variable "lzmanagementHsadoagentVMsRgName" {
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

variable "LAprotected_settings" {
  description = "primary_shared_key of Log Analytics "
  default     = null //intentionally kept it to something unrealistic
}

variable "LAsettings" {
  description = "workspace_id of Disk Encryption"
  default     = null //intentionally kept it to something unrealistic
}

variable "laWorkspacename" {
  description = "laWorkspacename"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "updateManagmentRgName" {
  description = "updateManagmentRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
