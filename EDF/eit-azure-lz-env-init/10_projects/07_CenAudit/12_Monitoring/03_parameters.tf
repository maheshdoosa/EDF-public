variable "environment" {
  description = "cenadtKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtResourceLocation" {
  description = "(required)"
  type        = string
}

variable "cenadtAgName" {
  description = "(required)"
  type        = string
}

variable "cenadtAgRgName" {
  description = "(required)"
  type        = string
}

variable "short_name" {
  description = "The short name of the action group. This will be used in SMS messages."
  default     = ""
  type        = string
}

variable "emails" {
  description = "List of email receivers"
  type = list(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = bool
  }))
  default = []
}

# variable "additionalTags" {
#   description = "(optional)"
#   type        = map(string)
#   default     = null
# }

#cenadt key vault
variable "cenadtKvName" {
  description = "cenadtKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "cenadtKvRgName" {
  description = "cenadtKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "query_description1" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description2" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description3" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description4" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description5" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description6" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description7" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description8" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description9" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description10" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description11" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description12" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description13" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description14" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description15" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description16" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description17" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description18" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "query_description19" {
  description = "(optional)"
  type        = string
  default     = null
}

# variable "query_description20" {
#   description = "(optional)"
#   type        = string
#   default     = null
# }
# variable "query_description21" {
#   description = "(optional)"
#   type        = string
#   default     = null
# }
# variable "query_description22" {
#   description = "(optional)"
#   type        = string
#   default     = null
# }

variable "authorized_resource_ids" {
  description = "(optional)"
  type        = set(string)
  default     = null
}

# variable "data_source_id" {
#   description = "(required)"
#   type        = string
# }

variable "enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "frequency" {
  description = "(required)"
  type        = number
}

# variable "query1" {
#   description = "(required)"
#   type        = string
# }

variable "queryname1" {
  description = "(required)"
  type        = string
}

variable "queryname2" {
  description = "(required)"
  type        = string
}

variable "queryname3" {
  description = "(required)"
  type        = string
}

variable "queryname4" {
  description = "(required)"
  type        = string
}

variable "queryname5" {
  description = "(required)"
  type        = string
}

variable "queryname6" {
  description = "(required)"
  type        = string
}

variable "queryname7" {
  description = "(required)"
  type        = string
}

variable "queryname8" {
  description = "(required)"
  type        = string
}

variable "queryname9" {
  description = "(required)"
  type        = string
}

variable "queryname10" {
  description = "(required)"
  type        = string
}

variable "queryname11" {
  description = "(required)"
  type        = string
}

variable "queryname12" {
  description = "(required)"
  type        = string
}

variable "queryname13" {
  description = "(required)"
  type        = string
}

variable "queryname14" {
  description = "(required)"
  type        = string
}

variable "queryname15" {
  description = "(required)"
  type        = string
}

variable "queryname16" {
  description = "(required)"
  type        = string
}

variable "queryname17" {
  description = "(required)"
  type        = string
}

variable "queryname18" {
  description = "(required)"
  type        = string
}

variable "queryname19" {
  description = "(required)"
  type        = string
}

# variable "queryname20" {
#   description = "(required)"
#   type        = string
# }

# variable "queryname21" {
#   description = "(required)"
#   type        = string
# }

# variable "queryname22" {
#   description = "(required)"
#   type        = string
# }


variable "query_type" {
  description = "(optional)"
  type        = string
  default     = null
}

# variable "AGname" {
#   description = "The name of the Action Group."
#   default     = ""
#   type        = string
# }

variable "laworkspaceResourceId" {
  description = "The name of the laworkspaceResourceId."
  default     = ""
  type        = string
}

variable "severitytype0" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "severitytype1" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "severitytype2" {
  description = "(optional)"
  type        = number
  default     = null
}

# variable "severitytype3" {
#   description = "(optional)"
#   type        = number
#   default     = null
# }

# variable "severitytype4" {
#   description = "(optional)"
#   type        = number
#   default     = null
# }

variable "throttling" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "time_window" {
  description = "(required)"
  type        = number
}

# variable "action" {
#   description = "nested block: NestingList, min items: 1, max items: 1"
#   type = set(object(
#     {
#       action_group           = set(string)
#       custom_webhook_payload = string
#       email_subject          = string
#     }
#   ))
# }

# variable "timeouts" {
#   description = "nested block: NestingSingle, min items: 0, max items: 0"
#   type = set(object(
#     {
#       create = string
#       delete = string
#       read   = string
#       update = string
#     }
#   ))
#   default = []
# }

# variable "trigger" {
#   description = "nested block: NestingList, min items: 1, max items: 1"
#   type = set(object(
#     {
#       operator  = string
#       threshold = number
#     }
#   ))
# }


variable "windowsdcrName" {
  description = "(required)"
  type        = string
}

variable "linuxdcrName" {
  description = "(required)"
  type        = string
}
