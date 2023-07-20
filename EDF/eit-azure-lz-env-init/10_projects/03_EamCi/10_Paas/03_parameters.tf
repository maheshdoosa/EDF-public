############ AVM Storage Account #######################

variable "avmsaRgName" {
  description = "avmsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "avmsaResourceLocation" {
#   description = "avmsaResourceLocation"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "avmsa" {
  description = "avmsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_accounttier" {
  description = "avmsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_storagetype" {
  description = "avmsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_accountreptype" {
  description = "avmsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_tlsversion" {
  description = "avmsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_accesstier" {
  description = "avmsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_httpstraffic" {
  description = "avmsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_publicaccess" {
  description = "avmsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_hnsenable" {
  description = "avmsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_nfsv3" {
  description = "avmsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_largefileshare" {
  description = "avmsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_acl" {
  description = "avmsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_bypass" {
  description = "avmsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "avmsa_routing" {
  description = "avmsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_publishinternet" {
  description = "avmsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_publishmicrosoft" {
  description = "avmsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "avmsaca" {
#   description = "avmsaca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "environment" {
  description = "environment"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
############ lawsa Storage Account #######################

variable "lawsaRgName" {
  description = "lawsaRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsaResourceLocation" {
  description = "lawsaResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa" {
  description = "lawsa"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_accounttier" {
  description = "lawsa_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_storagetype" {
  description = "lawsa_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_accountreptype" {
  description = "lawsa_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_tlsversion" {
  description = "lawsa_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_accesstier" {
  description = "lawsa_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_httpstraffic" {
  description = "lawsa_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_publicaccess" {
  description = "lawsa_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_hnsenable" {
  description = "lawsa_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_nfsv3" {
  description = "lawsa_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_largefileshare" {
  description = "lawsa_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_acl" {
  description = "lawsa_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_bypass" {
  description = "lawsa_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "lawsa_routing" {
  description = "lawsa_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_publishinternet" {
  description = "lawsa_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_publishmicrosoft" {
  description = "lawsa_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
# variable "lawsaca" {
#   description = "lawsaca"
#   default     = ".tmp-sa" //intentionally kept it to something unrealistic
#   type        = string
# }
variable "lawsa_blobsoftdelete" {
  description = "lawsa_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_containersoftdelete" {
  description = "lawsa_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_sharesoftdelete" {
  description = "lawsa_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

######## SA PE ########
variable "sa_private_dns_zone_name" {
  description = "sa_private_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_endpoint_name" {
  description = "avmsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "eamcipeSubnetName" {
  description = "eamcipeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "eamciVnetName" {
  description = "eamciVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "eamciNetworkingRgName" {
  description = "eamciNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "avmsa_endpoint_SC" {
  description = "avmsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "sapep_subresource_names" {
  description = "sapep_subresource_names"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "lawsa_endpoint_name" {
  description = "lawsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "lawsa_endpoint_SC" {
  description = "lawsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "eamciKvName" {
  description = "eamciKvName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "eamciKvRgName" {
  description = "eamciKvRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
######### Storage account diag settings #######
variable "category1" {
  default = "null"
  type    = string
}
variable "category2" {
  default = "null"
  type    = string
}
variable "category3" {
  default = "null"
  type    = string
}
variable "category4" {
  default = "null"
  type    = string
}

variable "categoryenabledtrue" {
  default = null
  type    = bool
}
variable "categoryenabledfalse" {
  default = null
  type    = bool
}

variable "retention_policy_enabled_true" {
  default = null
  type    = bool
}
variable "retention_policy_enabled_false" {
  default = null
  type    = bool
}

variable "retention_policydays" {
  default = null
  type    = number
}

# variable "diagnostic_log" {
#   default = []
#   type    = list(any)
# }
