variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#transit resource group
variable "lzTransitNetworkingRgName" {
  description = "lz hub resource group name"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#transit key vault
variable "transitKvName" {
  description = "transitKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "transitKvRgName" {
  description = "transitKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

#transit networking resources
variable "lzTransitNetworkingResourceLocation" {
  description = "hub networking resource location"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "lzTransitVnetName" {
  description = "lzTransitVnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "t1intfwTransitSubnetName" {
  description = "t1intfwTransitSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1extfwTransitSubnetName" {
  description = "t1extfwTransitSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1mgmtfwTransitSubnetName" {
  description = "t1mgmtfwTransitSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t2intfwTransitSubnetName" {
  description = "t2intfwTransitSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t2mgmtfwTransitSubnetName" {
  description = "t2mgmtfwTransitSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1HaSyncfwTransitSubnetName" {
  description = "t1HaSyncfwTransitSubnetName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1fwIlbIp" {
  description = "t1fwIlbIp"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t2fwIlbIp" {
  description = "t2fwIlbIp"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#Tier1FW-Internal
variable "t1fwIntRouteTableName" {
  description = "t1fwIntRouteTableName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1fwIntRouteNames" {
  description = "t1fwIntRouteNames"
  type        = list(string)
}
variable "t1fwIntRoutesNextHopTypes" {
  description = "t1fwIntRoutesNextHopTypes"
  type        = list(string)
}
variable "t1fwIntRouteNextHopIpSecrets" {
  description = "t1fwIntRouteNextHopIpSecrets"
  type        = list(string)
}

#Tier1FW-External
variable "t1fwExtRouteTableName" {
  description = "t1fwExtRouteTableName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1fwExtRouteNames" {
  description = "t1fwExtRouteNames"
  type        = list(string)
}
variable "t1fwExtRoutesNextHopTypes" {
  description = "t1fwExtRoutesNextHopTypes"
  type        = list(string)
}
variable "t1fwExtRouteNextHopIpSecrets" {
  description = "t1fwExtRouteNextHopIpSecrets"
  type        = list(string)
}

#Tier1FW-Management
variable "t1fwMgmtRouteTableName" {
  description = "t1fwExtRouteTableName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1fwMgmtRouteNames" {
  description = "t1fwExtRouteNames"
  type        = list(string)
}
variable "t1fwMgmtRoutesNextHopTypes" {
  description = "t1fwExtRoutesNextHopTypes"
  type        = list(string)
}

#Tier2FW-Internal
variable "t2fwIntRouteTableName" {
  description = "t2fwIntRouteTableName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t2fwIntRouteNames" {
  description = "t2fwIntRouteNames"
  type        = list(string)
}
variable "t2fwIntRoutesNextHopTypes" {
  description = "t2fwIntRoutesNextHopTypes"
  type        = list(string)
}
variable "t2fwIntRouteNextHopIpSecrets" {
  description = "t2fwIntRouteNextHopIpSecrets"
  type        = list(string)
}

#Tier2FW-Management
variable "t2fwMgmtRouteTableName" {
  description = "t2fwMgmtRouteTableName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t2fwMgmtRouteNames" {
  description = "t2fwMgmtRouteNames"
  type        = list(string)
}
variable "t2fwMgmtRoutesNextHopTypes" {
  description = "t2fwMgmtRoutesNextHopTypes"
  type        = list(string)
}
variable "t2fwMgmtRouteNextHopIpSecrets" {
  description = "t2fwMgmtRouteNextHopIpSecrets"
  type        = list(string)
}

#Tier1FW-HASync
variable "t1fwHaSyncRouteTableName" {
  description = "t1fwHaSyncRouteTableName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
variable "t1fwHaSyncRouteNames" {
  description = "t1fwHaSyncRouteNames"
  type        = list(string)
}
variable "t1fwHaSyncRoutesNextHopTypes" {
  description = "t1fwHaSyncRoutesNextHopTypes"
  type        = list(string)
}
