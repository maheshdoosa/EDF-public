variable "gendiamondhsKvName" {
  description = "gendiamondhsKvName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

variable "gendiamondhsKvRgName" {
  description = "gendiamondhsKvRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

############ genuprSA Storage Account #######################


variable "environment" {
  description = "environment"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}


variable "genuprSA" {
  description = "genuprSA"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}

variable "genuprSARgName" {
  description = "genuprSARgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSAResourceLocation" {
  description = "genuprSAResourceLocation"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_accounttier" {
  description = "genuprSA_accounttier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_storagetype" {
  description = "genuprSA_storagetype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_accountreptype" {
  description = "genuprSA_accountreptype"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_tlsversion" {
  description = "genuprSA_tlsversion"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_accesstier" {
  description = "genuprSA_accesstier"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_httpstraffic" {
  description = "genuprSA_httpstraffic"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_publicaccess" {
  description = "genuprSA_publicaccess"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_hnsenable" {
  description = "genuprSA_hnsenable"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_nfsv3" {
  description = "genuprSA_nfsv3"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_largefileshare" {
  description = "genuprSA_largefileshare"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_acl" {
  description = "genuprSA_acl"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_bypass" {
  description = "genuprSA_bypass"
  default     = [".tmp-sa"] //intentionally kept it to something unrealistic
  type        = list(string)
}
variable "genuprSA_routing" {
  description = "genuprSA_routing"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_publishinternet" {
  description = "genuprSA_publishinternet"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSA_publishmicrosoft" {
  description = "genuprSA_publishmicrosoft"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
  type        = string
}
variable "genuprSAca" {
  description = "genuprSAca"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprSA_blobsoftdelete" {
  description = "genuprSA_blobsoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprSA_containersoftdelete" {
  description = "genuprSA_containersoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprSA_sharesoftdelete" {
  description = "genuprSA_sharesoftdelete"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}

###### PE SA ############

variable "sa_private_dns_zone_name" {
  description = "sa_private_dns_zone_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprsa_endpoint_name" {
  description = "genuprsa_endpoint_name"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprsa_endpoint_SC" {
  description = "genuprsa_endpoint_SC"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "is_manual_connection" {
  description = "is_manual_connection"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprpep_subresource_names" {
  description = "eitmngdpeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprpeSubnetName" {
  description = "genuprpeSubnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprVnetName" {
  description = "genuprVnetName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
variable "genuprdNetworkingRgName" {
  description = "genuprdNetworkingRgName"
  default     = ".tmp-sa" //intentionally kept it to something unrealistic
}
