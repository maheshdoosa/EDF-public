variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenAuditLaRgName" {
  description = "cenAuditLaRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenAuditLaRgLocation" {
  description = "cenAuditLaRgLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "laWorkspaceName" {
  description = "laWorkspaceName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenAuditSentinelSolutionName" {
  description = "cenAuditSentinelSolutionName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

# variable "cenAuditLawAaName" {
#   description = "cenAuditLawAaName"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
#   type        = string
# }

variable "bootDiagLogStorageAccountName" {
  description = "bootDiagLogStorageAccountName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "bootDiagLogStorageAccountRgName" {
  description = "bootDiagLogStorageAccountRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
