variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}


#paas resource group
variable "lzmanagementHsLogsRgName" {
  description = "lzmanagementHsLogsRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#managementHs paas location
variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#la
variable "laWorkSpaceName" {
  description = "laWorkSpaceName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
