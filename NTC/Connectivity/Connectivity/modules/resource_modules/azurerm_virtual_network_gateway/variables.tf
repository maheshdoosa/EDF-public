variable "name" {
  type        = string
  description = "The name of the Virtual Network Gateway."
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Virtual Network Gateway."
}
variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}

variable "ip_configuration_name" {
  type = string
  description = "A name used for this IP Configuration."
}
variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Virtual Network Gateway should be located in."
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the Public IP where this Virtual Network Gateway should be located in."
}

variable "type" {
  type        = string
  description = "The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created."
}
variable "vpn_type" {
  type        = string
  description = "The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased. Changing this forces a new resource to be created."
}
variable "active_active" {
  type        = bool
  description = "If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false."
}
variable "enable_bgp" {
  type        = bool
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
}
variable "sku" {
  type        = string
  description = "Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway."
}
variable "private_ip_address_allocation" {
  type        = string
  description = "Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or Dynamic. Defaults to Dynamic."
}
variable "address_space" {
  type        = list(string)
  description = "The address space out of which IP addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation."
}
# variable "root_certificate_name" {
#   type        = string
#   description = "A user-defined name of the root certificate."
# }
# variable "public_cert_data" {
#   type        = string
#   description = "The public certificate of the root certificate authority. The certificate must be provided in Base-64 encoded X.509 format (PEM). In particular, this argument must not include the -----BEGIN CERTIFICATE----- or -----END CERTIFICATE----- markers."
# }
variable "aad_tenant" {
  type        = string
  description = "AzureAD Tenant URL"
}
variable "aad_audience" {
  type        = string
  description = "The client id of the Azure VPN application."
}
variable "aad_issuer" {
  type        = string
  description = "The STS url for your tenant"
}
variable "vpn_client_protocols" {
  type        = list(string)
  description = "List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. Values SSTP and IkeV2 are incompatible with the use of aad_tenant, aad_audience and aad_issuer."
}
variable "vpn_auth_types" {
  type        = list(string)
  description = "List of the vpn authentication types for the virtual network gateway. The supported values are AAD, Radius and Certificate."
}

# ==================== #
# LOG ANALYTICS 
# ==================== #
variable "monitor_diagnostic_settings_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_subscription_id" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}
variable "log_analytics_workspace_name" {
  type        = string
  description = "The ID of the subscription to assocaite to the Firewall."
  default     = null
}