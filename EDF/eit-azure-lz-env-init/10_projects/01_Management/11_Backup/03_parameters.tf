variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}


#managementHs Resoruce location
variable "lzHubManagementResourceLocation" {
  description = "lzHubManagementResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "backupVaultResourceGroup" {
  description = "backupVaultResourceGroup"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
