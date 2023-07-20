variable "gendiamondhsKvName" {
  description = "gendiamondhsKvName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "gendiamondhsKvRgName" {
  description = "gendiamondhsKvRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

############ genlwrSA Storage Account #######################


variable "environment" {
  description = "environment"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "genlwrSA" {
  description = "genlwrSA"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "genlwrSARgName" {
  description = "genlwrSARgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSAResourceLocation" {
  description = "genlwrSAResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_accounttier" {
  description = "genlwrSA_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_storagetype" {
  description = "genlwrSA_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_accountreptype" {
  description = "genlwrSA_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_tlsversion" {
  description = "genlwrSA_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_accesstier" {
  description = "genlwrSA_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_httpstraffic" {
  description = "genlwrSA_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_publicaccess" {
  description = "genlwrSA_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_hnsenable" {
  description = "genlwrSA_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_nfsv3" {
  description = "genlwrSA_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_largefileshare" {
  description = "genlwrSA_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_acl" {
  description = "genlwrSA_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_bypass" {
  description = "genlwrSA_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "genlwrSA_routing" {
  description = "genlwrSA_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_publishinternet" {
  description = "genlwrSA_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSA_publishmicrosoft" {
  description = "genlwrSA_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genlwrSAca" {
  description = "genlwrSAca"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrSA_blobsoftdelete" {
  description = "genlwrSA_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrSA_containersoftdelete" {
  description = "genlwrSA_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrSA_sharesoftdelete" {
  description = "genlwrSA_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

###### PE SA ############

variable "sa_private_dns_zone_name" {
  description = "sa_private_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrsa_endpoint_name" {
  description = "genlwrsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrsa_endpoint_SC" {
  description = "genlwrsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrpep_subresource_names" {
  description = "eitmngdpeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrpeSubnetName" {
  description = "genlwrpeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrVnetName" {
  description = "genlwrVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genlwrdNetworkingRgName" {
  description = "genlwrdNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
