#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#managementHs resource group
variable "lzmanagementSSNetworkingRgName" {
  description = "lz hub resource group name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#managementHs networking
variable "lzmanagementSSNetworkingResourceLocation" {
  description = "hub networking resource location"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
