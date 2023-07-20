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
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_01_members" {
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

variable "roleassignmetscope01" {
  description = "RG name for assigning into custom role"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

###############
variable "role_definition_name02" {
  description = "custom role assigning to AAC"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "HSmgmtKvName" {
  description = "HSmgmtKvName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "HSmgmtKvRgName" {
  description = "HSmgmtKvRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


################### EIT DevOps Role assignment variables ##############################

variable "role_definition_devOps_name01" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}


variable "EITDevopsAppRgName" {
  description = "RG name of EITDevopsAppRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "EITDevopsPackerRgName" {
  description = "RG name of EITDevopsPackerRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "EITDevopsctrlplaneRgName" {
  description = "RG name of EITDevopsctrlplaneRgName"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

############### AD Security Group Variables (03) ###############################

variable "ad_group_03_name" {
  description = "Name of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_03_description" {
  description = "description of the AD Group"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_03_owners" {
  description = "AD Group owners"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "ad_group_03_members" {
  description = "AD group members"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

################### Role assignment variables (03) ##############################

variable "role_definition_name03" {
  description = "built in role assigning to RG"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}

variable "roleassignmetscope03" {
  description = "RG name for assigning into custom role"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
  type        = string
}
