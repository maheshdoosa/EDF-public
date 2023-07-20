managementHsKvName = "emersonvmtest"
# managementSsKvRgName = ".security"

environment               = "Live"
updateManagmentRgName     = "ab-eit-uks-alz-hs-loga-rg"
updateManagmentRgLocation = "UK South"
laWorkspacename           = "eit-uks-alz-hs-loga-01"
laWorkspaceSku            = "Free"
automationAccountName     = "eit-uks-alz-hs-mgmt-aa-01"
automationAccountSku      = "Basic"
lawSolutionName           = "Updates"

amplsName                 = "eit-uks-alz-sand-ampls-01"
laEndPointName            = "eituksalzhsloga01-pe"
laSubResourceName         = ["azuremonitor"]
laPrivateServiceConnName  = "eit-uks-alz-sand-ampls-01"
aacEndPointName           = "eituksalzhsmgmtaa01-pe"
aacSubResourceName        = ["DSCAndHybridWorker"]
aacPrivateServiceConnName = "eit-uks-alz-hs-mgmt-aa-01"
