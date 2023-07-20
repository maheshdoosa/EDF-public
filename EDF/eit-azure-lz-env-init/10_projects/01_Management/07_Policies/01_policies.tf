###### MG Level #####

#Policy-1
module "ALZ-Platform-MG-Automation" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"

  policysetDefinitionCategory = "Automation"
  initiativeName              = "ALZ–Platform-MG-Automation"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ – Platform MG -Automation"
  initiativeDescription       = "Automation account variables should be encrypted"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/3657f5a0-770e-44a3-b44e-9431ba1e9735"
      parameters = {}
    }
  ]

  parameters = <<PARAMETERS
    {
    }
PARAMETERS
}

module "AssignPolicy" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Automation"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-Automation.initiativeId
  description          = "ALZ-Platform-MG-Automation"
  displayName          = "ALZ-Platform-MG-Automation"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyAutomationEnforcementMode

  parameters = <<PARAMETERS
  {

  }
 PARAMETERS

  identityType = "SystemAssigned"
}


#Policy-2
module "ALZ-Platform-MG-Backup" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Backup"
  initiativeName              = "ALZ-Platform-MG-Backup"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ - Platform MG-Backup"
  initiativeDescription       = "Azure Backup should be enabled for Virtual Machines"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/013e242c-8828-4970-87b3-ab247555486d"
      parameters = {}
    }
  ]

  parameters = <<PARAMETERS
    {
    }
PARAMETERS
}
module "Assign-ALZ-Platform-MG-Backup" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Backup"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-Backup.initiativeId
  description          = "ALZ-Platform-MG-Backup"
  displayName          = "ALZ-Platform-MG-Backup"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyBackupEnforcementMode

  parameters = <<PARAMETERS
  {

  }
 PARAMETERS

  identityType = "SystemAssigned"
}


#Policy-3
module "ALZ-Platform-MG-Compute" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Compute"
  initiativeName              = "ALZ-Platform-MG-Compute"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform MG-Compute"
  initiativeDescription       = "ALZ-Platform MG-Compute"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/2835b622-407b-4114-9198-6f7064cbe0dc"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/2c89a2e5-7285-40fe-afe0-ae8654b92fb2"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/9b597639-28e4-48eb-b506-56b05d366257"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"
      parameters = {}
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/c0e996f8-39cf-4af9-9f45-83fbde810432"
      parameters = {
        approvedExtensions = "[parameters('approvedExtensions')]"
      }
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/c43e4a30-77cb-48ab-a4dd-93f175c63b57"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/1d84d5fb-01f6-4d12-ba4f-4a26081d403d"
      parameters = {}
    },
  ]

  parameters = <<PARAMETERS
    {
      "approvedExtensions": {
      "type": "Array",
      "metadata": {
        "description": "The list of approved extension types that can be installed. Example: AzureDiskEncryption",
        "displayName": "Approved extensions"
        }
      }
    }
PARAMETERS
}
module "Assign-ALZ-Platform-MG-Compute" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Compute"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-Compute.initiativeId
  description          = "ALZ-Platform-MG-Compute"
  displayName          = "ALZ-Platform-MG-Compute"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyComputeEnforcementMode

  parameters = jsonencode({
    "approvedExtensions" : {
      "value" : var.allowedExtensions
    }
  })

  identityType = "SystemAssigned"
}

#Policy-4
module "ALZ-Platform-MG-General" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "General"
  initiativeName              = "ALZ-Platform-MG-General"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform MG-General"
  initiativeDescription       = "ALZ-Platform-MG-General"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
      parameters = {
        listOfAllowedLocations = "[parameters('allowedLocations')]"
      }
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
      parameters = {
        listOfAllowedLocations = "[parameters('allowedLocations')]"
      }
    },
    #Commented following as discussed with Azure designer (Sean M) - 16/11
    # {
    #   policyId   = "/providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c"
    #   parameters = {
    #     listOfResourceTypesAllowed = "[parameters('allowedResourceTypes')]"
    #   }
    # },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/0a914e76-4921-4c19-b460-a2d36003525a"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/a451c1ef-c6ca-483d-87ed-f49761e3ffb5"
      parameters = {}
    },
  ]

  parameters = <<PARAMETERS
    {
        "allowedLocations": {
            "type": "Array",
            "metadata": {
                "description": "The list of allowed locations for resources.",
                "displayName": "Allowed locations"
            }
        }
    }
PARAMETERS
}
module "Assign-ALZ-Platform-MG-General" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-General"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-General.initiativeId
  description          = "ALZ-Platform-MG-General"
  displayName          = "ALZ-Platform-MG-General"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyGeneralEnforcementMode

  parameters = jsonencode({
    "allowedLocations" : {
      "value" : var.allowedLocations
    }
  })

  identityType = "SystemAssigned"
}

#Policy-5
module "ALZ-Platform-MG-KeyVault" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "KeyVault"
  initiativeName              = "ALZ-Platform-MG-KeyVault"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform-MG-KeyVault"
  initiativeDescription       = "ALZ-Platform-MG-KeyVault"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/cf820ca0-f99e-4f3e-84fb-66e913812d21"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/0b60c0b2-2dc2-4e1c-b5c9-abbed971de53"
      parameters = {}
    },
  ]

  parameters = <<PARAMETERS
    {
    }
PARAMETERS
}
module "Assign-ALZ-Platform-MG-KeyVault" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-KeyVault"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-KeyVault.initiativeId
  description          = "ALZ-Platform-MG-KeyVault"
  displayName          = "ALZ-Platform-MG-KeyVault"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyKeyVaultEnforcementMode

  parameters = <<PARAMETERS
  {

  }
 PARAMETERS

  identityType = "SystemAssigned"
}

#Policy-6
module "ALZ-Platform-MG-Monitoring" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Monitoring"
  initiativeName              = "ALZ-Platform-MG-Monitoring"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform-MG-Monitoring"
  initiativeDescription       = "ALZ-Platform-MG-Monitoring"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/b02aacc0-b073-424e-8298-42b22829ee0a"
      parameters = {}
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/053d3325-282c-4e5c-b944-24faffd30d77"
      parameters = {
        logAnalytics           = "[parameters('logAnalytics')]"
        listOfImageIdToInclude = "[parameters('listOfImageIdToInclude')]"
      }
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/0868462e-646c-4fe3-9ced-a733534b6a2c"
      parameters = {
        logAnalytics           = "[parameters('logAnalytics')]"
        listOfImageIdToInclude = "[parameters('listOfImageIdToInclude')]"
      }
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/7796937f-307b-4598-941c-67d3a05ebfe7"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/a70ca396-0a34-413a-88e1-b956c1e683be"
      parameters = {}
    },
    # {
    #   policyId   = "/providers/Microsoft.Authorization/policyDefinitions/7f89b1eb-583c-429a-8828-af049802c1d9"
    #   parameters = {
    #     listOfResourceTypes = "[parameters('listOfResourceTypes')]"
    #   }
    # },
  ]

  parameters = <<PARAMETERS
  {
      "logAnalytics": {
        "type": "String",
        "metadata": {
          "displayName": "Log Analytics workspace",
          "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
          "strongType": "omsWorkspace",
          "assignPermissions": true
        }
      },
      "listOfImageIdToInclude": {
        "type": "Array",
        "metadata": {
          "displayName": "Optional: List of VM images that have supported Linux OS to add to scope",
          "description": "Example value: '/subscriptions/<subscriptionId>/resourceGroups/YourResourceGroup/providers/Microsoft.Compute/images/ContosoStdImage'"
        },
        "defaultValue": []
      }
    }
PARAMETERS
}
module "Assign-ALZ-Platform-MG-Monitoring" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Monitoring"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-Monitoring.initiativeId
  description          = "ALZ-Platform-MG-Monitoring"
  displayName          = "ALZ-Platform-MG-Monitoring"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyMonitoringEnforcementMode

  parameters = jsonencode({
    "logAnalytics" : {
      "value" : var.monitoringLaWorkspace
    },
    "listOfImageIdToInclude" : {
      "value" : var.monitoringListOfImageId
    }
  })

  identityType = "SystemAssigned"
}

#Policy-7
module "ALZ-Platform-MG-Network" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Network"
  initiativeName              = "ALZ-Platform-MG-Network"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform MG-Network"
  initiativeDescription       = "ALZ-Platform-MG-Network"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/ea4d6841-2173-4317-9747-ff522a45120f"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/60d21c4f-21a3-4d94-85f4-b924e6aeeda4"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/88c0b9da-ce96-4b03-9635-f29a937e2900"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/83a86a26-fd1f-447c-b59d-e51f44264114"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/2c89a2e5-7285-40fe-afe0-ae8654b92fab"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/e372f825-a257-4fb8-9175-797a8a8627d6"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/35f9c03a-cc27-418e-9c0c-539ff999d010"
      parameters = {}
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/b6e2945c-0b7b-40f5-9233-7a5323b5cdc6"
      parameters = {
        listOfLocations = "[parameters('listOfLocations')]"
      }
    },

  ]

  parameters = <<PARAMETERS
  {
      "listOfLocations": {
        "type": "Array",
        "metadata": {
          "displayName": "Locations",
          "description": "Audit if Network Watcher is not enabled for region(s).",
          "strongType": "location"
        }
      }
  }
PARAMETERS
}
module "Assign-ALZ-Platform-MG-Network" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Network"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-Network.initiativeId
  description          = "ALZ-Platform-MG-Network"
  displayName          = "ALZ-Platform-MG-Network"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyNetworkingEnforcementMode

  parameters = jsonencode({
    "listOfLocations" : {
      "value" : var.allowedLocations
    }
  })

  identityType = "SystemAssigned"
}

#Policy-8
module "ALZ-Platform-MG-ASC" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Azure Security Center"
  initiativeName              = "ALZ-Platform-MG-ASC"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform-MG-ASC"
  initiativeDescription       = "ALZ-Platform-MG-ASC"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/e1e5fd5d-3e4c-4ce1-8661-7d1873ae6b15"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/4f11b553-d42e-4e3a-89be-32ca364cad4c"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/22730e10-96f6-4aac-ad84-9383d35b5917"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/ebb62a0c-3560-49e1-89ed-27e074e9f8ad"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/f6de0be7-9a8a-4b8a-b349-43cf02d22f7c"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/f8456c1c-aa66-4dfb-861a-25d127b775c9"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/e3576e28-8b17-4677-84c3-db2990658d64"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/5f76cf89-fbf2-47fd-a3f4-b891fa780b60"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/b4d66858-c922-44e3-9566-5cdb7a7be744"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/9daedab3-fb2d-461e-b861-71790eead4f6"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/bb91dfba-c30d-4263-9add-9c2384e659a6"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/6b1cbf55-e8b6-442f-ba4c-7246b6381474"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/ac076320-ddcf-4066-b451-6154267e8ad2"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/5c607a2e-c700-4744-8254-d77e7c9eb5e4"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/af6cd1bd-1635-48cb-bde7-5b15693900b9"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/9297c21d-2ed6-4474-b48f-163f75654ce3"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/86b3d65f-7626-441e-b690-81a8b71cff60"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/0b15565f-aa9e-48ba-8619-45960f2c314d"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/aa633080-8b72-40c4-a2d7-d00c03e80bed"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/6e2593d9-add6-4083-9c9b-4b7d2188c899"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/09024ccc-0c5f-475e-9457-b7c0d9ed487b"
      parameters = {}
    },




  ]

  parameters = <<PARAMETERS
    {
    }
PARAMETERS
}
module "Assign-ALZ-Platform-MG-ASC" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-ASC"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-ASC.initiativeId
  description          = "ALZ-Platform-MG-ASC"
  displayName          = "ALZ-Platform-MG-ASC"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicySecurityGroupEnforcementMode

  parameters = <<PARAMETERS
  {

  }
 PARAMETERS

  identityType = "SystemAssigned"
}

#Policy-9
module "ALZ-HS-Storage" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Storage"
  initiativeName              = "ALZ-HS-Storage"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-HS-Storage"
  initiativeDescription       = "ALZ-HS-Storage"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/c9d007d0-c057-4772-b18c-01e546713bcd"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c"
      parameters = {}
    },
  ]

  parameters = <<PARAMETERS
    {
    }
PARAMETERS
}
module "Assign-ALZ-HS-Storage" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Storage"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-HS-Storage.initiativeId
  description          = "ALZ-HS-Storage"
  displayName          = "ALZ-HS-Storage"
  location             = var.lzPoliciesResourceLocation
  category             = "compute"
  enforcementMode      = var.mgPolicyStorageEnforcementMode

  parameters = <<PARAMETERS
  {

  }
 PARAMETERS

  identityType = "SystemAssigned"
}


###### Subscription Level #####

#Policy-1
module "ALZ-Platform-Sub-Tagging" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Compute"
  initiativeName              = "ALZ-Platform-Sub-Tagging"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform-Sub-Tagging"
  initiativeDescription       = "ALZ-Platform-Sub-Tagging"
  managementGroupId           = null

  listOfPolicies = [
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/8ce3da23-7156-49e4-b145-24f95f9dcb46"
      parameters = {
        tagName  = "[parameters('tagName')]",
        tagValue = "[parameters('tagValue')]"
      }
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/d157c373-a6c4-483d-aaad-570756956268"
      parameters = {
        tagName  = "[parameters('tagName')]",
        tagValue = "[parameters('tagValue')]"
      }
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26"
      parameters = {
        tagName  = "[parameters('tagName')]",
        tagValue = "[parameters('tagValue')]"
      }
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/871b6d14-10aa-478d-b590-94f262ecfa99"
      parameters = {
        tagName = "[parameters('tagName')]"
      }
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
      parameters = {
        tagName = "[parameters('tagName')]"
      }
    }
  ]

  parameters = <<PARAMETERS
  {
      "tagName": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Name",
          "description": "Name of the tag, such as 'environment'"
        }
      },
      "tagValue": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Value",
          "description": "Value of the tag, such as 'production'"
        }
      }
  }
  PARAMETERS
}
module "Assign-ALZ-Platform-Sub-Tagging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "Sub-Tagging"
  scopeId              = "/subscriptions/${local.managementHsSubscriptionId}"
  policyId             = module.ALZ-Platform-Sub-Tagging.initiativeId
  description          = "ALZ-Platform-Sub-Tagging"
  displayName          = "ALZ-Platform-Sub-Tagging"
  location             = var.lzPoliciesResourceLocation
  category             = "Tagging"
  enforcementMode      = var.subPolicyTaggingEnforcementMode

  parameters = jsonencode({
    "tagName" : {
      "value" : "environment"
    },
    "tagValue" : {
      "value" : "HS Management"
    },
  })

  identityType = "SystemAssigned"
}

#Policy-2
module "ALZ-HS-Sub-Monitoring" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Monitoring"
  initiativeName              = "ALZ-HS-Sub-Monitoring"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-HS-Sub-Monitoring"
  initiativeDescription       = "ALZ-HS-Sub-Monitoring"
  managementGroupId           = null

  listOfPolicies = [
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/053d3325-282c-4e5c-b944-24faffd30d77"
      parameters = {
        logAnalytics           = "[parameters('logAnalytics')]",
        listOfImageIdToInclude = "[parameters('listOfImageIdToInclude')]"
      }
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/0868462e-646c-4fe3-9ced-a733534b6a2c"
      parameters = {
        logAnalytics           = "[parameters('logAnalytics')]",
        listOfImageIdToInclude = "[parameters('listOfImageIdToInclude')]"
      }
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/7796937f-307b-4598-941c-67d3a05ebfe7"
      parameters = {}
    }
  ]

  parameters = <<PARAMETERS
  {
      "logAnalytics": {
        "type": "String",
        "metadata": {
          "displayName": "Log Analytics workspace",
          "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
          "strongType": "omsWorkspace",
          "assignPermissions": true
        }
      },
      "listOfImageIdToInclude": {
        "type": "Array",
        "metadata": {
          "displayName": "Optional: List of VM images that have supported Linux OS to add to scope",
          "description": "Example value: '/subscriptions/<subscriptionId>/resourceGroups/YourResourceGroup/providers/Microsoft.Compute/images/ContosoStdImage'"
        },
        "defaultValue": []
      }
    }
PARAMETERS
}
module "Assign-ALZ-HS-Sub-Monitoring" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "Sub-Monitoring"
  scopeId              = "/subscriptions/${local.managementHsSubscriptionId}"
  policyId             = module.ALZ-HS-Sub-Monitoring.initiativeId
  description          = "ALZ-HS-Sub-Monitoring"
  displayName          = "ALZ-HS-Sub-Monitoring"
  location             = var.lzPoliciesResourceLocation
  category             = "Monitoring"
  enforcementMode      = var.subPolicyMonitorEnforcementMode

  parameters = jsonencode({
    "logAnalytics" : {
      "value" : var.monitoringLaWorkspace
    },
    "listOfImageIdToInclude" : {
      "value" : var.monitoringListOfImageId
    }
  })

  identityType = "SystemAssigned"
}

#Policy-3
module "ALZ-HS-Sub-Network" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Network"
  initiativeName              = "ALZ-HS-Sub-Network"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-HS-Sub-Network"
  initiativeDescription       = "ALZ-HS-Sub-Network"
  managementGroupId           = null

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/88c0b9da-ce96-4b03-9635-f29a937e2900"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/83a86a26-fd1f-447c-b59d-e51f44264114"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/2c89a2e5-7285-40fe-afe0-ae8654b92fab"
      parameters = {}
    }
  ]

  parameters = <<PARAMETERS
    {
    }
PARAMETERS
}
module "Assign-ALZ-HS-Sub-Network" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "Sub-Network"
  scopeId              = "/subscriptions/${local.managementHsSubscriptionId}"
  policyId             = module.ALZ-HS-Sub-Network.initiativeId
  description          = "ALZ-HS-Sub-Network"
  displayName          = "ALZ-HS-Sub-Network"
  location             = var.lzPoliciesResourceLocation
  category             = "Network"
  enforcementMode      = var.subPolicyNetworkEnforcementMode

  parameters = <<PARAMETERS
  {

  }
 PARAMETERS

  identityType = "SystemAssigned"
}

#Policy-6
module "ALZ-Platform-MG-Monitoring-WindowsVM" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Monitoring"
  initiativeName              = "ALZ-Platform-MG-Monitoring-WindowsVM"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform-MG-Monitoring-WindowsVM"
  initiativeDescription       = "ALZ-Platform-MG-Monitoring-WindowsVM"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/4efbd9d8-6bc6-45f6-9be2-7fe9dd5d89ff"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/94f686d6-9a24-4e19-91f1-de937dc171a4"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/ca817e41-e85a-4783-bc7f-dc532d36235e"
      parameters = {}
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/eab1f514-22e3-42e3-9a1f-e1dc9199355c"
      parameters = {
        DcrResourceId = "[parameters('dcrResourceId')]"
      }
    }
  ]

  parameters = <<EOF
    {
        "dcrResourceId": {
        "type": "String",
        "metadata": {
          "displayName": "Data Collection Rule Resource Id",
          "description": "Resource Id of the Data Collection Rule to be applied on the Windows machines in scope.",
          "strongType": ""
        },
        "defaultValue": ""
      }
    }
    EOF
}

module "Assign-ALZ-Platform-MG-Monitoring-WindowsVM" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Monitoring-WindowsVM"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-Monitoring-WindowsVM.initiativeId
  description          = "ALZ-Platform-MG-Monitoring-WindowsVM"
  displayName          = "ALZ-Platform-MG-Monitoring-WindowsVM"
  location             = var.lzPoliciesResourceLocation
  category             = "Monitoring"
  enforcementMode      = var.mgPolicyMonitoringEnforcementMode

  parameters = jsonencode({
    "dcrResourceId" : {
      #      "value" : "${data.azurerm_key_vault_secret.alz-sentinel-seclogs-winevent.value}"
      value : data.azurerm_key_vault_secret.alz-sentinel-seclogs-winevent.value
    }
  })

  identityType = "SystemAssigned"
}
module "ALZ-Platform-MG-Monitoring-LinuxVM" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  policysetDefinitionCategory = "Monitoring"
  initiativeName              = "ALZ-Platform-MG-Monitoring-LinuxVM"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Platform-MG-Monitoring-LinuxVM"
  initiativeDescription       = "ALZ-Platform-MG-Monitoring-LinuxVM"
  managementGroupId           = local.platformManagementGroupId

  listOfPolicies = [
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/a4034bc6-ae50-406d-bf76-50f4ee5a7811"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/56a3e4f8-649b-4fac-887e-5564d11e8d3a"
      parameters = {}
    },
    {
      policyId   = "/providers/Microsoft.Authorization/policyDefinitions/845857af-0333-4c5d-bbbc-6076697da122"
      parameters = {}
    },
    {
      policyId = "/providers/Microsoft.Authorization/policyDefinitions/2ea82cdd-f2e8-4500-af75-67a2e084ca74"
      parameters = {
        DcrResourceId = "[parameters('dcrResourceId')]"
      }
    }
  ]

  parameters = <<EOF
    {
        "dcrResourceId": {
        "type": "String",
        "metadata": {
          "displayName": "Data Collection Rule Resource Id",
          "description": "Resource Id of the Data Collection Rule to be applied on the Linux machines in scope.",
          "strongType": ""
        },
        "defaultValue": ""
      }
    }
    EOF
}

module "Assign-ALZ-Platform-MG-Monitoring-LinuxVM" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment?ref=v1.1.19"

  policyAssignmentName = "MG-Monitoring-LinuxVM"
  scopeId              = "/providers/Microsoft.Management/managementGroups/${local.platformManagementGroupId}"
  policyId             = module.ALZ-Platform-MG-Monitoring-LinuxVM.initiativeId
  description          = "ALZ-Platform-MG-Monitoring-LinuxVM"
  displayName          = "ALZ-Platform-MG-Monitoring-LinuxVM"
  location             = var.lzPoliciesResourceLocation
  category             = "Monitoring"
  enforcementMode      = var.mgPolicyMonitoringEnforcementMode

  parameters = jsonencode({
    "dcrResourceId" : {
      #      "value" : "${data.azurerm_key_vault_secret.alz-sentinel-seclogs-linuxevent.value}"
      "value" : data.azurerm_key_vault_secret.alz-sentinel-seclogs-linuxevent.value
    }
  })

  identityType = "SystemAssigned"
}
