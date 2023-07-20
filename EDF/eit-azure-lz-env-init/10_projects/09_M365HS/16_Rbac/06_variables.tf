############### AD Security Group Variables ###############################

variable "ad_group_01_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_01_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_01_owners" {
  description = "AD Group owners"
  default     = [".tmp-loc"] //intentionally kept it to something unrealistic
  type        = list(string)
}

variable "ad_group_01_members" {
  description = "AD group members"
  default     = [".tmp-loc"] //intentionally kept it to something unrealistic
  type        = list(string)
}


variable "ad_group_02_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_02_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_02_owners" {
  description = "AD Group owners"
  default     = [".tmp-loc"] //intentionally kept it to something unrealistic
  type        = list(string)
}

variable "ad_group_02_members" {
  description = "AD group members"
  default     = [".tmp-loc"] //intentionally kept it to something unrealistic
  type        = list(string)
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
