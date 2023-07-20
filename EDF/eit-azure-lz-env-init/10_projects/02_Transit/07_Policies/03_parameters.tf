#managementHs key vault
variable "transitKvName" {
  description = "transitKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "transitKvRgName" {
  description = "transitKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#managementHs networking
variable "lzPoliciesResourceLocation" {
  description = "lzPoliciesResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "subPolicyTaggingEnforcementMode" {
  type        = bool
  default     = false
  description = "enforcementMode"
}

variable "subPolicyMonitorEnforcementMode" {
  type        = bool
  default     = false
  description = "enforcementMode"
}

variable "subPolicyNetworkEnforcementMode" {
  type        = bool
  default     = false
  description = "enforcementMode"
}

variable "monitoringListOfImageId" {
  description = "monitoringListOfImageId"
  type        = list(string)

  default = []
}
variable "monitoringLaWorkspace" {
  description = "monitoringLaWorkspace"
  default     = ""
}
