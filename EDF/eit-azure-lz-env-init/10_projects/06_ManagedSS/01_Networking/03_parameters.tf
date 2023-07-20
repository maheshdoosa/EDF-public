#environment
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

#mngdss key vault
variable "mngdssKvName" {
  description = "mngdssKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "mngdssKvRgName" {
  description = "mngdssKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}


variable "UDR" {
  description = "UDR to multiple Subnets"
  type        = map(any)
  default     = {}
}

variable "vnets" {
  type    = map(any)
  default = {}
}

variable "rgs" {
  type    = map(any)
  default = {}
}

variable "UDR_Subnet_Mapping" {
  type    = map(any)
  default = {}
}

################# VNET Peering Variables ###############

variable "vnet_peering" {
  description = "Vnet Peering to multiple subscription Vnet"
  type        = map(any)
  default     = {}
}

variable "tenantId" {
  description = "tenantId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "spokeSubscriptionId" {
  description = "spokeSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "hubSubscriptionId" {
  description = "hubSubscriptionId"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowVirtualNetworkAccess" {
  description = "AllowVirtualNetworkAccess"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowForwardedTraffic" {
  description = "AllowForwardedTraffic"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowGatewayTransitVNet12" {
  description = "AllowGatewayTransitVNet12"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "AllowGatewayTransitVNet21" {
  description = "AllowGatewayTransitVNet21"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

variable "UseRemoteGateways" {
  description = "UseRemoteGateways"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
}

##### NSGs ################################
variable "nsg" {
  type        = map(any)
  description = "Key-Vaule Pairs. Key is NSG name and Value is a map of NSG details"
  default     = {}
}

variable "nsgrules" {
  type        = map(any)
  description = "Key-Value Pairs. Key is NSG name and Value is a list of rules for that NSG"
  default     = {}
}

variable "nsg_subnet_mapping" {
  type        = map(any)
  description = "Key-Value Pairs. Key is NSG name and Value is a map of subnets to associate"
  default     = {}
}

variable "asg_rg" {
  type        = map(any)
  description = "Key-Vaule Pairs. Key is ASG name and Value is a map of RG details"
  default     = {}
}

################ Private endpoint ##################

variable "laEndPointName" {
  description = "Private endpoint Name "
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "saEndPointName" {
  description = "Private endpoint Name "
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "endPointLocation" {
  description = "Private endpoint location "
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "resourceGroupName" {
  description = "Resource Group name where private endpoints to be created"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "subnetId" {
  description = "Subnet ID where private endpoints to be created"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "azMonitorPrivateLinkScopeId" {
  description = "Azure Monitory Private Link Scope ID where private endpoints to be connected"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "saAzMonitorPrivateLinkScopeId" {
  description = "Azure Monitory Private Link Scope ID where private endpoints to be connected"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "laSubResourceName" {
  description = "Subresoruce name e.g. AzureMonitor"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "saSubResourceName" {
  description = "Subresoruce name e.g. AzureMonitor"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "laPrivateServiceConnName" {
  description = "Private Serviec connection Name"
  default     = ".tmp" //intentionally kept it to something unrealistic
}

variable "saPrivateServiceConnName" {
  description = "Private Serviec connection Name"
  default     = ".tmp" //intentionally kept it to something unrealistic
}
