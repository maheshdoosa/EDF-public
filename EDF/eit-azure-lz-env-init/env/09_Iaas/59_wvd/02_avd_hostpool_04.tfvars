#tfvars for hostpool

hostpool = {
  "hostpool4" = {
    avd_ResourceGroup_Name    = "CST-UKS-PRD-SS-PIT-DNY-RG-01"
    avd_HostPool_Name         = "CST-UKS-PRD-SS-AVD-HPL-PRT-PIT-DAR-DNY"
    avd_Location              = "UK South"
    avd_Pooltype              = "Pooled"
    avd_Maximum_Sessions      = 16
    avd_Load_Balancer_Type    = "BreadthFirst"
    avd_HostPool_FriendlyName = "Partner IT Support Multi Session Deny"
    avd_HostPool_Accesslevel  = "Deny"
    SPkeyvaultName            = "avmeitprdsswvdsub01kv"
    SPkeyvaultRGName          = ".security"
    spApplicationId           = "avmeitprdsswvdsub01spid"
    spSecret                  = "avmeitprdsswvdsub01spkey"
    tenantId                  = "tenantId"
    subscriptionId            = "wvd-prd-SubscriptionId"
    LZworkspaceId             = "AVD-LAW-resourceID"
    additionalTags = {
      "Environment" : "Standard Secured AVD"
      "Business Unit" : "Customer"
      "Major Function" : "Enterprise IT"
      "Service" : "AVD"
      "Project Code" : "TAFD"
      "Service Level" : "TBC"
      "Category" : "Infrastructure"
      "Role" : "AVD hostpool"
      "Support" : "Cloud Services Azure TSI"
      "Cost Centre" : "6C040713"
      "Owner" : "CloudServices@edfenergy.com"
    }
  }
}

#tfvars for Desktop app group

avd_AppGroup = {
  "avd_AppGroup7" = {
    avd_ResourceGroup_Name     = "CST-UKS-PRD-SS-PIT-DNY-RG-01"
    avd_HostPool_ID            = "CST-UKS-PRD-SS-AVD-HPL-PRT-PIT-DAR-DNY"
    avd_Location               = "UK South"
    avd_AppGroup_Name          = "CST-UKS-PRD-SS-AVD-DSK-PRT-PIT-DAR-DNY"
    avd_AppGroup_Type          = "Desktop"
    avd_AppGroup_friendly_Name = "Partner IT Support Multi Session Deny"
    avd_AppGroup_Description   = "Partner IT Support Multi Session Deny"
    avd_WorkSpace_ID           = "CUS-UKS-PRD-SS-AVD-WKS-ITS"
    HPkeyvaultName             = "avmeitprdsswvdsub01kv"
    HPkeyvaultRGName           = ".security"
    additionalTags = {
      "Environment" : "Standard Secured AVD"
      "Business Unit" : "Customer"
      "Major Function" : "Enterprise IT"
      "Service" : "AVD"
      "Project Code" : "TAFD"
      "Service Level" : "TBC"
      "Category" : "Infrastructure"
      "Role" : "AVD hostpool"
      "Support" : "Cloud Services Azure TSI"
      "Cost Centre" : "6C040713"
      "Owner" : "CloudServices@edfenergy.com"
    }
  },
  "avd_AppGroup8" = {
    avd_ResourceGroup_Name     = "CST-UKS-PRD-SS-PIT-DNY-RG-01"
    avd_HostPool_ID            = "CST-UKS-PRD-SS-AVD-HPL-PRT-PIT-DAR-DNY"
    avd_Location               = "UK South"
    avd_AppGroup_Name          = "CST-UKS-PRD-SS-AVD-APP-PRT-PIT-APP-DNY"
    avd_AppGroup_Type          = "RemoteApp"
    avd_AppGroup_friendly_Name = "Partner IT Support Multi Session Deny"
    avd_AppGroup_Description   = "Partner IT Support Multi Session Deny"
    avd_WorkSpace_ID           = "CUS-UKS-PRD-SS-AVD-WKS-ITS"
    HPkeyvaultName             = "avmeitprdsswvdsub01kv"
    HPkeyvaultRGName           = ".security"
    additionalTags = {
      "Environment" : "Standard Secured AVD"
      "Business Unit" : "Customer"
      "Major Function" : "Enterprise IT"
      "Service" : "AVD"
      "Project Code" : "TAFD"
      "Service Level" : "TBC"
      "Category" : "Infrastructure"
      "Role" : "AVD hostpool"
      "Support" : "Cloud Services Azure TSI"
      "Cost Centre" : "6C040713"
      "Owner" : "CloudServices@edfenergy.com"
    }
  }
}

ADgroups = {
  "ADgroups7" = {
    AD_group_displayName = "R-CST-UKS-PRD-SS-AVD-DSK-PRT-PIT-DAR-DNY"
    AppgroupResourceID   = "CST-UKS-PRD-SS-AVD-DSK-PRT-PIT-DAR-DNY"
    RoleName             = "Desktop Virtualization User"
    AppGrpkeyvaultName   = "avmeitprdsswvdsub01kv"
    AppGrpkeyvaultRGName = ".security"
  },
  "ADgroups8" = {
    AD_group_displayName = "R-CST-UKS-PRD-SS-AVD-APP-PRT-PIT-APP-DNY"
    AppgroupResourceID   = "CST-UKS-PRD-SS-AVD-APP-PRT-PIT-APP-DNY"
    RoleName             = "Desktop Virtualization User"
    AppGrpkeyvaultName   = "avmeitprdsswvdsub01kv"
    AppGrpkeyvaultRGName = ".security"
  }
}
