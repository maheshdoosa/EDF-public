#tfvars for hostpool

hostpool = {
  "hostpool7" = {
    avd_ResourceGroup_Name    = "CST-UKS-PRD-SS-CON-DNY-RG-01"
    avd_HostPool_Name         = "CST-UKS-PRD-SS-AVD-HPL-PRT-CON-DAR-DNY"
    avd_Location              = "UK South"
    avd_Pooltype              = "Pooled"
    avd_Maximum_Sessions      = 16
    avd_Load_Balancer_Type    = "BreadthFirst"
    avd_HostPool_FriendlyName = "Consultants Multi Session Deny"
    avd_HostPool_Accesslevel  = "Deny"
    SPkeyvaultName            = "avmeitprdsswvdsub01kv"
    SPkeyvaultRGName          = ".security"
    spApplicationId           = "avmeitprdsswvdsub01spid"
    spSecret                  = "avmeitprdsswvdsub01spkey"
    tenantId                  = "tenantId"
    subscriptionId            = "wvd-prd-SubscriptionId"
    LZworkspaceId             = "laworkspaceResourceId"
    additionalTags = {
      "Environment" : "Standard Secured AVD"
      "Business Unit" : "Customer"
      "Major Function" : "Enterprise IT"
      "Service" : "AVD"
      "Project Code" : "TAFD"
      "Service Level" : "Gold"
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
  "avd_AppGroup12" = {
    avd_ResourceGroup_Name     = "CST-UKS-PRD-SS-CON-DNY-RG-01"
    avd_HostPool_ID            = "CST-UKS-PRD-SS-AVD-HPL-PRT-CON-DAR-DNY"
    avd_Location               = "UK South"
    avd_AppGroup_Name          = "CST-UKS-PRD-SS-AVD-DSK-PRT-CON-DAR-DNY"
    avd_AppGroup_Type          = "Desktop"
    avd_AppGroup_friendly_Name = "Consultants Multi Session Deny"
    avd_AppGroup_Description   = "Consultants Multi Session Deny"
    avd_WorkSpace_ID           = "CUS-UKS-PRD-SS-AVD-WKS-CON"
    HPkeyvaultName             = "avmeitprdsswvdsub01kv"
    HPkeyvaultRGName           = ".security"
    additionalTags = {
      "Environment" : "Standard Secured AVD"
      "Business Unit" : "Customer"
      "Major Function" : "Enterprise IT"
      "Service" : "AVD"
      "Project Code" : "TAFD"
      "Service Level" : "Gold"
      "Category" : "Infrastructure"
      "Role" : "AVD hostpool"
      "Support" : "Cloud Services Azure TSI"
      "Cost Centre" : "6C040713"
      "Owner" : "CloudServices@edfenergy.com"
    }
  },
  "avd_AppGroup13" = {
    avd_ResourceGroup_Name     = "CST-UKS-PRD-SS-CON-DNY-RG-01"
    avd_HostPool_ID            = "CST-UKS-PRD-SS-AVD-HPL-PRT-CON-DAR-DNY"
    avd_Location               = "UK South"
    avd_AppGroup_Name          = "CST-UKS-PRD-SS-AVD-APP-PRT-CON-APP-DNY"
    avd_AppGroup_Type          = "RemoteApp"
    avd_AppGroup_friendly_Name = "Consultants Multi Session Deny"
    avd_AppGroup_Description   = "Consultants Multi Session Deny"
    avd_WorkSpace_ID           = "CUS-UKS-PRD-SS-AVD-WKS-CON"
    HPkeyvaultName             = "avmeitprdsswvdsub01kv"
    HPkeyvaultRGName           = ".security"
    additionalTags = {
      "Environment" : "Standard Secured AVD"
      "Business Unit" : "Customer"
      "Major Function" : "Enterprise IT"
      "Service" : "AVD"
      "Project Code" : "TAFD"
      "Service Level" : "Gold"
      "Category" : "Infrastructure"
      "Role" : "AVD hostpool"
      "Support" : "Cloud Services Azure TSI"
      "Cost Centre" : "6C040713"
      "Owner" : "CloudServices@edfenergy.com"
    }
  }
}

ADgroups = {
  "ADgroups12" = {
    AD_group_displayName = "R-CST-UKS-PRD-SS-AVD-DSK-PRT-CON-DAR-DNY"
    AppgroupResourceID   = "CST-UKS-PRD-SS-AVD-DSK-PRT-CON-DAR-DNY"
    RoleName             = "Desktop Virtualization User"
    AppGrpkeyvaultName   = "avmeitprdsswvdsub01kv"
    AppGrpkeyvaultRGName = ".security"
  },
  "ADgroups13" = {
    AD_group_displayName = "R-CST-UKS-PRD-SS-AVD-APP-PRT-CON-APP-DNY"
    AppgroupResourceID   = "CST-UKS-PRD-SS-AVD-APP-PRT-CON-APP-DNY"
    RoleName             = "Desktop Virtualization User"
    AppGrpkeyvaultName   = "avmeitprdsswvdsub01kv"
    AppGrpkeyvaultRGName = ".security"
  }
}
