variable "gendiamondhsKvName" {
  description = "gendiamondhsKvName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "gendiamondhsKvRgName" {
  description = "gendiamondhsKvRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

############ genstgSA Storage Account #######################


variable "environment" {
  description = "environment"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "genstgSA" {
  description = "genstgSA"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "genstgSARgName" {
  description = "genstgSARgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSAResourceLocation" {
  description = "genstgSAResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_accounttier" {
  description = "genstgSA_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_storagetype" {
  description = "genstgSA_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_accountreptype" {
  description = "genstgSA_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_tlsversion" {
  description = "genstgSA_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_accesstier" {
  description = "genstgSA_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_httpstraffic" {
  description = "genstgSA_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_publicaccess" {
  description = "genstgSA_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_hnsenable" {
  description = "genstgSA_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_nfsv3" {
  description = "genstgSA_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_largefileshare" {
  description = "genstgSA_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_acl" {
  description = "genstgSA_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_bypass" {
  description = "genstgSA_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "genstgSA_routing" {
  description = "genstgSA_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_publishinternet" {
  description = "genstgSA_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSA_publishmicrosoft" {
  description = "genstgSA_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genstgSAca" {
  description = "genstgSAca"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgSA_blobsoftdelete" {
  description = "genstgSA_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgSA_containersoftdelete" {
  description = "genstgSA_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgSA_sharesoftdelete" {
  description = "genstgSA_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

###### PE SA ############

variable "sa_private_dns_zone_name" {
  description = "sa_private_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgsa_endpoint_name" {
  description = "genstgsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgsa_endpoint_SC" {
  description = "genstgsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgpep_subresource_names" {
  description = "eitmngdpeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgpeSubnetName" {
  description = "genstgpeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgVnetName" {
  description = "genstgVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genstgdNetworkingRgName" {
  description = "genstgdNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
