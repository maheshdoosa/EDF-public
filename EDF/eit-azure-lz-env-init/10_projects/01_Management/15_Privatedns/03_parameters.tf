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

variable "vnetlinkpvtdnszones" {
  description = "centralize private dns zone link to vnet"
  type        = list(any)
  default     = []
}


#  ############### Data Sources Variable details ###########################

#   variable "HSmgmtKvName" {
#      description = "Data source KV name"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }

#   variable "HSmgmtKvRgName" {
#      description = "Data source KV RG name"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }


# ############### AD Security Group Variables ###############################

#   variable "ad_group_01_name" {
#      description = "Name of the AD Group"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }

#   variable "ad_group_01_description" {
#      description = "description of the AD Group"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }

#   variable "ad_group_01_owners" {
#      description = "AD Group owners"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }

#   variable "ad_group_01_members" {
#      description = "AD group members"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }

#  ################### Role assignment variables ##############################

#   variable "role_definition_name01" {
#      description = "built in role assigning to RG"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }

#    variable "roleassignmetscope01" {
#      description = "RG name for assigning into custom role"
#      default     = ".tmp-loc" //intentionally kept it to something unrealistic
#  }

################ A Records ##########
variable "pvtdnszoneArecords" {
  description = "centralize private dns zone for HS"
  type        = list(any)
  default     = []
}
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
