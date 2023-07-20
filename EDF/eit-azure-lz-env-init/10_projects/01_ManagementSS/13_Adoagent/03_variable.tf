###########managementSs key vault
variable "managementSsKvName" {
  description = "managementSsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "updateManagmentRgName" {
  description = "updateManagmentRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "laWorkspacename" {
  description = "laWorkspacename"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "lzmanagementSsadoagentVMsRgName" {
  description = "adoagentbuildRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "sigalleryname" {
  description = "Shared Image gallery name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "sharedimagedefname" {
  description = "Shared Image definition name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmsssubnetname" {
  description = "vmss subnet Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmssvnetname" {
  description = "vmss vnet Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "vmssvnetrg" {
  description = "vmss vnet RG Name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
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
