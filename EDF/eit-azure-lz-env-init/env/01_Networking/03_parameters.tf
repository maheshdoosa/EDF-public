#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#managementSs resource group
variable "lzmanagementSsNetworkingRgName" {
  description = "lz hub resource group name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#managementSs networking
variable "lzmanagementSsNetworkingResourceLocation" {
  description = "hub networking resource location"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
