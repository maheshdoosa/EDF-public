variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

########Private DNS resource group
variable "rgs" {
  description = "RgName"
  default     = {} //intentionally kept it to something unrealistic
  type        = map(any)
}

variable "pvtdnszones" {
  description = "centralize private dns zone for SS"
  type        = list(any)
  default     = []
}

variable "pvtdnszoneArecords" {
  description = "centralize private dns zone for SS"
  type        = list(any)
  default     = []
}

# variable "vnetlinkpvtdnszones" {
#   description = "centralize private dns zone link to vnet"
#   type        = list(any)
#   default     = []
# }

variable "KvName" {
  description = "AVMKvName"
  default     = ".tmp "
  type        = string
}
variable "KvRgName" {
  description = "AVMKvRgName"
  default     = ".tmp "
  type        = string
}

########### two of the record name were duplicated so created using direct modules  ###########################

variable "name01" {
  description = "record name"
  default     = ".tmp "
  type        = string
}

variable "zone_name01" {
  description = "record zone name"
  default     = ".tmp "
  type        = string
}

variable "resource_group_name01" {
  description = "record rg"
  default     = ".tmp "
  type        = string
}

variable "ttl01" {
  description = "record ttl"
  default     = ".tmp "
  type        = string
}

##########################################################

variable "name02" {
  description = "record name"
  default     = ".tmp "
  type        = string
}

variable "zone_name02" {
  description = "record zone name"
  default     = ".tmp "
  type        = string
}

variable "resource_group_name02" {
  description = "record rg"
  default     = ".tmp "
  type        = string
}

variable "ttl02" {
  description = "record ttl"
  default     = ".tmp "
  type        = string
}
