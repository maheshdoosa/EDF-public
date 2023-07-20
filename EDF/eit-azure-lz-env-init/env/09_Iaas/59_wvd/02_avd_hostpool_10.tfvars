#tfvars for hostpool

hostpool = {
  "hostpool10" = {
    avd_ResourceGroup_Name    = "CST-UKS-PRD-SS-MUNI-LTD-RG-01"
    avd_HostPool_Name         = "CST-UKS-PRD-SS-AVD-HPL-PRT-MUNI-APP-LTD"
    avd_Location              = "UK South"
    avd_Pooltype              = "Pooled"
    avd_Maximum_Sessions      = 16
    avd_Load_Balancer_Type    = "BreadthFirst"
    avd_HostPool_FriendlyName = "Manchester Uni Multi Session Limited"
    avd_HostPool_Accesslevel  = "Limited"
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
  "avd_AppGroup18" = {
    avd_ResourceGroup_Name     = "CST-UKS-PRD-SS-MUNI-LTD-RG-01"
    avd_HostPool_ID            = "CST-UKS-PRD-SS-AVD-HPL-PRT-MUNI-APP-LTD"
    avd_Location               = "UK South"
    avd_AppGroup_Name          = "CST-UKS-PRD-SS-AVD-APP-PRT-MUNI-APP-LTD"
    avd_AppGroup_Type          = "RemoteApp"
    avd_AppGroup_friendly_Name = "Manchester Uni Multi Session Limited"
    avd_AppGroup_Description   = "Manchester Uni Multi Session Limited"
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
  "ADgroups18" = {
    AD_group_displayName = "R-CST-UKS-PRD-SS-AVD-APP-PRT-MUNI-APP-LTD"
    AppgroupResourceID   = "CST-UKS-PRD-SS-AVD-APP-PRT-MUNI-APP-LTD"
    RoleName             = "Desktop Virtualization User"
    AppGrpkeyvaultName   = "avmeitprdsswvdsub01kv"
    AppGrpkeyvaultRGName = ".security"
  }
}
