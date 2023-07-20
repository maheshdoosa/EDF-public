variable "environment" {
  description = "environment"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "mngdhsKvName" {
  description = "mngdhsKvName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "mngdhsKvRgName" {
  description = "mngdhsKvRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "hpbdvdbdevRgName" {
  description = "hpbdvdbdevRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "hpbdvdbdevResourceLocation" {
  description = "hpbdvdbdevResourceLocation"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "hpbdvdbdevServerName" {
  description = "hpbdvdbdevServerName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "postgreSqlsku" {
  description = "postgreSqlsku"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "postgreSqlstorageMb" {
  description = "postgreSqlstorageMb"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "backupRetensionDays" {
  description = "backupRetensionDays"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "georedundantBackupEnabled" {
  description = "georedundantBackupEnabled"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "autoGrowEnabled" {
  description = "autoGrowEnabled"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "postgreSqlServerVersion" {
  description = "postgreSqlServerVersion"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "sslEnforcementEnabled" {
  description = "sslEnforcementEnabled"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "databaseNames" {
  description = "databaseNames"
  default     = [".tmp-name"] //intentionally kept it to something unrealistic
  type        = list(string)
}

variable "charset" {
  description = "charset"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "collation" {
  description = "collation"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "hpbdvdSQLEndPointName" {
  description = "hpbdvdSQLEndPointName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}

variable "privateEndpointVNETRgName" {
  description = "privateEndpointVNETRgName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "hpbdvdSQLServiceConnName" {
  description = "hpbdvdSQLServiceConnName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "privateEndpointSubnetName" {
  description = "privateEndpointSubnetName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "privateEndpointVNETName" {
  description = "privateEndpointVNETName"
  default     = ".tmp-name" //intentionally kept it to something unrealistic
  type        = string
}
variable "privateEndpointSubResourceName" {
  description = "privateEndpointSubResourceName"
  default     = [".tmp-name"] //intentionally kept it to something unrealistic
  type        = list(string)
}


######  Diag settings #####


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
