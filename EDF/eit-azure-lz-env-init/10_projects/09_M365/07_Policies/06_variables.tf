############### Data Sources Variable details ###########################

variable "m365KvName" {
  description = "Data source KV name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "m365KvRgName" {
  description = "Data source KV RG name"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}


############### AD Security Group Variables ###############################

variable "ad_group_01_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_01_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_01_owners" {
  description = "AD Group owners"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_01_members" {
  description = "AD group members"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}


variable "ad_group_02_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_02_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_02_owners" {
  description = "AD Group owners"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_02_members" {
  description = "AD group members"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_03_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_03_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_03_owners" {
  description = "AD Group owners"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_03_members" {
  description = "AD group members"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_04_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_04_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_04_owners" {
  description = "AD Group owners"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "ad_group_04_members" {
  description = "AD group members"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

################### Role assignment variables ##############################

variable "role_definition_name01" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "role_definition_name02" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "role_definition_name03" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "role_definition_name04" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "roleassignmetscope01" {
  description = "RG name for assigning into custom role"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}
