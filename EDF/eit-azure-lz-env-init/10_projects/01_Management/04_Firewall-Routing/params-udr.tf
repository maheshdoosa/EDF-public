variable "lzRouteTableHubMgmtName01" {
  description = "The name of the RouteTable being created."
  default     = "routetable"
}

variable "lzRouteTableHubMgmtName02" {
  description = "The name of the RouteTable being created."
  default     = "routetable"
}

variable "lzRouteTableSpokeAppWebName" {
  description = "The name of the RouteTable being created."
  default     = "routetable"
}

variable "lzRouteTableSpokePaasGpaasName" {
  description = "The name of the RouteTable being created."
  default     = "routetable"
}

variable "lzUdrHubtoInternetandSpoke1Name" {
  description = "A list of public subnets inside the vNet."
  default     = []
}

variable "lzUdrSpoke01toHubName" {
  description = "A list of public subnets inside the vNet."
  default     = []
}

variable "lzUdrHubtoSpoke02Name" {
  description = "A list of public subnets inside the vNet."
  default     = []
}

variable "lzUdrSpoke02toHubName" {
  description = "A list of public subnets inside the vNet."
  default     = []
}

variable "route_nexthop_type_hub_mgmt01" {
  description = "The next hop address"
  default     = []
}

variable "route_nexthop_type_hub_mgmt02" {
  description = "The next hop address"
  default     = []
}

variable "route_nexthop_type_Spoke1" {
  description = "The next hop address"
  default     = []
}

variable "route_nexthop_type_Spoke2" {
  description = "The next hop address"
  default     = []
}


variable "disable_bgp_route_propagation" {
  description = "Controls propagation of routes learned by BGP on that route table. True means disable."
  default     = "true"
}
