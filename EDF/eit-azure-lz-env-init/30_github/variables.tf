variable "ghOrganisation" {
  description = "github organisation"
  default     = ".tmp-ghOrg" //intentionally kept it to something unrealistic
}

variable "kvname" {
  description = "key vault name"
  default     = ".tmp-kvname" //intentionally kept it to something unrealistic
}

variable "kvrg" {
  description = "key vault resource group"
  default     = ".tmp-kvrg" //intentionally kept it to something unrealistic
}

variable "ghRepoNumOfReviewersEnforced" {
  type        = number
  description = "Number of reveiwers enforced on master branch merge"
  default     = 0 //intentionally kept it to something unrealistic
}
