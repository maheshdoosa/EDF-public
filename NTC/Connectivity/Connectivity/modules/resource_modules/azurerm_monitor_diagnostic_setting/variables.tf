variable "name" {
  type        = string
  description = "The name of the Monitor diagnostics setting."
}

variable "log_analytics_workspace_subscription_id" {
  type        = string
  description = "The ID of the Log Analytics Workspace connected to the Monitor diagnostics setting."
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "The ID of the Log Analytics Workspace connected to the Monitor diagnostics setting."
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "The ID of the Log Analytics Workspace connected to the Monitor diagnostics setting."
}

variable "target_resource_id" {
  type        = string
  description = "Target resource id"
}