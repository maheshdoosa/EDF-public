variable "Workspace" {
  type = map(object({
    avd_WorkSpace_Name         = string
    avd_Location               = string
    avd_WorkSpace_FriendlyName = string
    avd_WorkSpace_Description  = string
    avd_ResourceGroup_Name     = string
    additionalTags             = map(string)
  }))
  description = "Workspaces of AVD"
  default     = {}
}
