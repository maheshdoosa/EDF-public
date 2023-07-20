# #environment
# variable "environment" {
#   description = "environment"
#   default     = ".tmp-loc" //intentionally kept it to something unrealistic
# }

# #mgmtss key vault
# variable "mgmtssKvName" {
#   description = "mgmtssKvName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "mgmtssKvRgName" {
#   description = "mgmtssKvRgName"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }


# variable "UDR" {
#   description = "UDR to multiple Subnets"
#   type        = map
#   default     = {}
# }

# variable "vnets" {
#   type    = map
#   default = {}
# }

# variable "rgs" {
#   type    = map
#   default = {}
# }

# variable "UDR_Subnet_Mapping" {
#   type    = map
#   default = {}
# }

# ################# VNET Peering Variables ###############

# variable "vnet_peering" {
#   description = "Vnet Peering to multiple subscription Vnet"
#   type        = map
#   default     = {}
# }

# variable "tenantIdSecretKey" {
#   description = "tenantIdSecretKey"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "spokeSubscriptionIdSecretKey" {
#   description = "spokeSubscriptionIdSecretKey"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "hubSubscriptionIdSecretKey" {
#   description = "hubSubscriptionIdSecretKey"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "AllowVirtualNetworkAccess" {
#   description = "AllowVirtualNetworkAccess"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "AllowForwardedTraffic" {
#   description = "AllowForwardedTraffic"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "AllowGatewayTransitVNet12" {
#   description = "AllowGatewayTransitVNet12"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "AllowGatewayTransitVNet21" {
#   description = "AllowGatewayTransitVNet21"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# variable "UseRemoteGateways" {
#   description = "UseRemoteGateways"
#   default     = ".tmp-name" //intentionally kept it to something unrealistic
# }

# ##### NSGs ################################
# variable "nsg" {
#   type        = map
#   description = "Key-Vaule Pairs. Key is NSG name and Value is a map of NSG details"
#   default     = {}
# }

# variable "nsgrules" {
#   type        = map
#   description = "Key-Value Pairs. Key is NSG name and Value is a list of rules for that NSG"
#   default     = {}
# }

# variable "nsg_subnet_mapping" {
#   type        = map
#   description = "Key-Value Pairs. Key is NSG name and Value is a map of subnets to associate"
#   default     = {}
# }

# variable "asg_rg" {
#   type        = map
#   description = "Key-Vaule Pairs. Key is ASG name and Value is a map of RG details"
#   default     = {}
# }

# ################ Private endpoint ##################

# variable "laEndPointName" {
#   description = "Private endpoint Name "
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "saEndPointName" {
#   description = "Private endpoint Name "
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "endPointLocation" {
#   description = "Private endpoint location "
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "resourceGroupName" {
#   description = "Resource Group name where private endpoints to be created"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "subnetId" {
#   description = "Subnet ID where private endpoints to be created"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "azMonitorPrivateLinkScopeId" {
#   description = "Azure Monitory Private Link Scope ID where private endpoints to be connected"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "saAzMonitorPrivateLinkScopeId" {
#   description = "Azure Monitory Private Link Scope ID where private endpoints to be connected"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "laSubResourceName" {
#   description = "Subresoruce name e.g. AzureMonitor"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "saSubResourceName" {
#   description = "Subresoruce name e.g. AzureMonitor"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "laPrivateServiceConnName" {
#   description = "Private Serviec connection Name"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }

# variable "saPrivateServiceConnName" {
#   description = "Private Serviec connection Name"
#   default     = ".tmp" //intentionally kept it to something unrealistic
# }
