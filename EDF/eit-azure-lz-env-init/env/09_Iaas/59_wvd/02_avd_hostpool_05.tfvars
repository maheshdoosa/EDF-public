#tfvars for hostpool


hostpool = {
  "hostpool5" = {
    avd_ResourceGroup_Name    = "CST-UKS-PRD-SS-EMP-ALW-RG-01"
    avd_HostPool_Name         = "CST-UKS-PRD-SS-AVD-HPL-EMP-EMP-DAR-ALW"
    avd_Location              = "UK South"
    avd_Pooltype              = "Pooled"
    avd_Maximum_Sessions      = 16
    avd_Load_Balancer_Type    = "BreadthFirst"
    avd_HostPool_FriendlyName = "EDF Employee COBO"
    avd_HostPool_Accesslevel  = "Allow"
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
  "avd_AppGroup9" = {
    avd_ResourceGroup_Name     = "CST-UKS-PRD-SS-EMP-ALW-RG-01"
    avd_HostPool_ID            = "CST-UKS-PRD-SS-AVD-HPL-EMP-EMP-DAR-ALW"
    avd_Location               = "UK South"
    avd_AppGroup_Name          = "CST-UKS-PRD-SS-AVD-APP-EMP-EMP-APP-ALW"
    avd_AppGroup_Type          = "RemoteApp"
    avd_AppGroup_friendly_Name = "EDF Employee COBO"
    avd_AppGroup_Description   = "EDF Employee COBO"
    avd_WorkSpace_ID           = "CUS-UKS-PRD-SS-AVD-WKS-EMP"
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
  "ADgroups9" = {
    AD_group_displayName = "R-CST-UKS-PRD-SS-AVD-APP-EMP-EMP-APP-ALW"
    AppgroupResourceID   = "CST-UKS-PRD-SS-AVD-APP-EMP-EMP-APP-ALW"
    RoleName             = "Desktop Virtualization User"
    AppGrpkeyvaultName   = "avmeitprdsswvdsub01kv"
    AppGrpkeyvaultRGName = ".security"
  }
}
