############### Data Sources Variable details ###########################

variable "SSmgmtKvName" {
  description = "Data source KV name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "SSmgmtKvRgName" {
  description = "Data source KV RG name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


############### AD Security Group Variables ###############################

variable "ad_group_01_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_02_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_01_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_02_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_01_owners" {
  description = "AD Group owners"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_02_owners" {
  description = "AD Group owners"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_01_members" {
  description = "AD group members"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_02_members" {
  description = "AD group members"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
################### Role assignment variables ##############################

variable "role_definition_name01" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "role_definition_name02" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "roleassignmetscoperg" {
  description = "RG name for assigning into custom role"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "roleassignmetscope01" {
  description = "RG name for assigning into custom role"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "roleassignmetscope02" {
  description = "RG name for assigning into custom role"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
