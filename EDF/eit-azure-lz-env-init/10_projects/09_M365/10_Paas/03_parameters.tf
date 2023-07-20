#paas resource group
variable "m365SubRgName" {
  description = "m365SubRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
#M365 Subscription paas location
variable "m365subResourceLocation" {
  description = "m365subResourceLocation"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
#storage account
variable "m365SA" {
  description = "m365SA"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


# variable "additionalTags" {
#   type        = map(string)
#   description = "Additional tags to be enforced"
#   default     = {}
# }


# variable "sku" {
#   description = "(Optional) sku of the resource"
#   type        = string
#   default     = "Standard"
# }


variable "saprivate_dns_zone_name" {
  description = "saprivate_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365sa_endpoint_name" {
  description = "m365sa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365sa_endpoint_SC" {
  description = "m365sa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365sa_subresource_names" {
  description = "m365sa_subresource_names"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365subSSKvName" {
  description = "m365subSSKvName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365subSSKvRgName" {
  description = "m365subSSKvRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365pesubnetName" {
  description = "m365pesubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365VnetName" {
  description = "m365VnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "m365NetworkingRgName" {
  description = "m365NetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
