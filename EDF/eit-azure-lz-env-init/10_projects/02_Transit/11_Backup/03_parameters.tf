######### RecoveryServiceVault ############

variable "resourceGroupName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "resourceLocation" {
  description = "resource location"
  default     = "" //intentionally kept it to something unrealistic
}

variable "environment" {
  description = "environment"
  default     = ".tmp-loc" //intentionally kept it to something unrealistic
}

variable "costcentre" {
  description = "cost centre"
  default     = "eit"
}

variable "additionalTags" {
  type        = map(string)
  description = "Additional tags to be enforced"
  default     = {}
}

variable "vm_backup_policy_timezone" {
  description = "Specifies the timezone for VM backup schedules. Defaults to `UTC`."
  type        = string
  default     = "UTC"
}

variable "sku" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = "Standard"
}

variable "soft_delete_enabled" {
  description = "(Optional) soft delete enabled of the resource"
  type        = bool
  default     = true
}


variable "recovery_vault_name" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "LaName" {
  description = "resource group name"
  default     = ".tmp-rg" //intentionally kept it to something unrealistic
}

variable "La_resource_group_name" {
  description = "resource location"
  default     = "" //intentionally kept it to something unrealistic
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID where the logs are sent"
  type        = string
  default     = null
}

variable "recovery_services_vault_id" {
  description = "recovery_services_vault id"
  type        = string
  default     = null
}

variable "log_category" {
  description = "log category"
  default     = ""
}

variable "log_category_enabled" {
  description = "log category"
  type        = string
  default     = ""
}

variable "log_category_retention" {
  description = "log category"
  type        = string
  default     = ""
}

variable "log_category_retention_days" {
  description = "log category"
  type        = string
  default     = ""
}

############# Backup #############

variable "backup_policy_id" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  type        = string
  default     = ""
}

variable "backup_policyId" {
  description = "Azure Recovery Vault custom name. Empty by default, using naming convention."
  default     = ""
}

variable "infraVM_backup_policy" {
  description = "Name of the backup policy which will be applied"
  default     = ""
}

variable "backup_policy_time_02" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "infraVM_backup_policy_02" {
  description = "Name of the backup policy which will be applied"
  default     = ""
}

variable "backup_policy_frequency" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "backup_policy_time" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_daily_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_weekly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_weekly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_monthly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_monthly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_monthly_weeks" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_yearly_count" {
  description = "(Optional) sku of the resource"
  type        = string
  default     = ""
}

variable "retention_yearly_weekdays" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_yearly_weeks" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}

variable "retention_yearly_months" {
  description = "(Optional) sku of the resource"
  type        = list(string)
  default     = []
}
