variable "avd_resource_group" {
  type = map(object({
    avd_ResourceGroup_Name = string
    avd_Location           = string
    additionalTags         = map(string)
  }))
  description = "Resource groups of AVD"
  default     = {}
}
