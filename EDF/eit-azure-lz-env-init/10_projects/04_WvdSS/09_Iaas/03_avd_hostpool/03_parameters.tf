variable "hostpool" {
  type = map(object({
    avd_ResourceGroup_Name    = string
    avd_HostPool_Name         = string
    avd_Location              = string
    avd_Pooltype              = string
    avd_Maximum_Sessions      = string
    avd_Load_Balancer_Type    = string
    avd_HostPool_FriendlyName = string
    LZworkspaceId             = string
    avd_HostPool_Accesslevel  = string
    SPkeyvaultName            = string
    SPkeyvaultRGName          = string
    spApplicationId           = string
    spSecret                  = string
    tenantId                  = string
    subscriptionId            = string
    additionalTags            = map(string)
  }))
  description = "Hostpool of AVD"
  default     = {}
}


variable "avd_AppGroup" {
  type = map(object({
    avd_ResourceGroup_Name     = string
    avd_HostPool_ID            = string
    avd_Location               = string
    avd_AppGroup_Name          = string
    avd_AppGroup_Type          = string
    avd_AppGroup_friendly_Name = string
    avd_AppGroup_Description   = string
    avd_WorkSpace_ID           = string
    HPkeyvaultName             = string
    HPkeyvaultRGName           = string
    additionalTags             = map(string)
  }))
  description = "App group of AVD"
  default     = {}
}

variable "ADgroups" {
  type = map(object({
    AD_group_displayName = string
    AppgroupResourceID   = string
    RoleName             = string
    AppGrpkeyvaultName   = string
    AppGrpkeyvaultRGName = string
    }
  ))
  description = "AD groups of AVD"
  default     = {}
}
