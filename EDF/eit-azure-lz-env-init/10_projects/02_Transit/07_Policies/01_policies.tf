###### Subscription Level #####

#Policy-1
module "ALZ-Transit-Sub-Tagging" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative"
  policysetDefinitionCategory = "Compute"
  initiativeName              = "ALZ-Transit-Sub-Tagging"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Transit-Sub-Tagging"
  initiativeDescription       = "ALZ-Transit-Sub-Tagging"
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
module "Assign-ALZ-Transit-Sub-Tagging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment"

  policyAssignmentName = "Sub-Tagging"
  scopeId              = "/subscriptions/${local.transitSubscriptionId}"
  policyId             = module.ALZ-Transit-Sub-Tagging.initiativeId
  description          = "ALZ-Transit-Sub-Tagging"
  displayName          = "ALZ-Transit-Sub-Tagging"
  location             = var.lzPoliciesResourceLocation
  category             = "Tagging"
  enforcementMode      = var.subPolicyTaggingEnforcementMode

  parameters = jsonencode({
    "tagName" : {
      "value" : "environment"
    },
    "tagValue" : {
      "value" : "HS Transit"
    },
  })

  identityType = "SystemAssigned"
}

#Policy-2
module "ALZ-Transit-Sub-Monitoring" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative"
  policysetDefinitionCategory = "Monitoring"
  initiativeName              = "ALZ-Transit-Sub-Monitoring"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Transit-Sub-Monitoring"
  initiativeDescription       = "ALZ-Transit-Sub-Monitoring"
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
module "Assign-ALZ-Transit-Sub-Monitoring" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment"

  policyAssignmentName = "Sub-Monitoring"
  scopeId              = "/subscriptions/${local.transitSubscriptionId}"
  policyId             = module.ALZ-Transit-Sub-Monitoring.initiativeId
  description          = "ALZ-Transit-Sub-Monitoring"
  displayName          = "ALZ-Transit-Sub-Monitoring"
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
module "ALZ-Transit-Sub-Network" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative"
  policysetDefinitionCategory = "Network"
  initiativeName              = "ALZ-Transit-Sub-Network"
  policyType                  = "Custom"
  initiativeDisplayName       = "ALZ-Transit-Sub-Network"
  initiativeDescription       = "ALZ-Transit-Sub-Network"
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
module "Assign-ALZ-Transit-Sub-Network" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-assignment"

  policyAssignmentName = "Sub-Network"
  scopeId              = "/subscriptions/${local.transitSubscriptionId}"
  policyId             = module.ALZ-Transit-Sub-Network.initiativeId
  description          = "ALZ-Transit-Sub-Network"
  displayName          = "ALZ-Transit-Sub-Network"
  location             = var.lzPoliciesResourceLocation
  category             = "Network"
  enforcementMode      = var.subPolicyNetworkEnforcementMode

  parameters = <<PARAMETERS
  {

  }
 PARAMETERS

  identityType = "SystemAssigned"
}
