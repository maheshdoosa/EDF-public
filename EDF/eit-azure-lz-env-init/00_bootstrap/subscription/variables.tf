variable "kvname" {
  description = "key vault name"
  default     = "tmpkvname" //intentionally kept it to something unrealistic
}

variable "kvrg" {
  description = "key vault resource group"
  default     = ".tmp-kvrg" //intentionally kept it to something unrealistic
}

variable "adoBootStrapProjectName" {
  description = "adoBootStrapProjectName"
  default     = ".tmp-kvrg" //intentionally kept it to something unrealistic
}

variable "newSubscriptionId" {
  description = "newSubscriptionId"
  default     = ".tmp-kvrg" //intentionally kept it to something unrealistic
}

variable "newSubscriptionName" {
  description = "newSubscriptionName"
  default     = ".tmp-kvrg" //intentionally kept it to something unrealistic
}
