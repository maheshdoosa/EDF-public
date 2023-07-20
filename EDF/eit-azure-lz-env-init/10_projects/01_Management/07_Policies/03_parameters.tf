#managementHs key vault
variable "managementHsKvName" {
  description = "managementHsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "managementHsKvRgName" {
  description = "managementHsKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#managementHs networking
variable "lzPoliciesResourceLocation" {
  description = "lzPoliciesResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "mgPolicyAutomationEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicyBackupEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicyComputeEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicyGeneralEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicyKeyVaultEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicyMonitoringEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicyNetworkingEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicySecurityGroupEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "mgPolicyStorageEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "subPolicyTaggingEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "subPolicyMonitorEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "subPolicyNetworkEnforcementMode" {
  type        = bool
  default     = true
  description = "enforcementMode"
}

variable "allowedExtensions" {
  description = "allowedExtensions"
  type        = list(string)

  default = ["admincentermodule", "adorganizationalunit", "azurediskencryption", "dependencyagentwindows", "JsonADDomainExtension", "VMAccessAgent", "iaasantimalware", "microsoftmonitoringagent", "customscriptextension", "dsc"]
}

variable "allowedLocations" {
  description = "allowedLocations"
  type        = list(string)

  default = ["Uk South", "Uk West"]
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
