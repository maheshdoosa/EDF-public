environment                     = "Staging"
lzHubNetworkingRgName           = "eit-uks-stg-hubvnet-rg-01"
lzHubNetworkingResourceLocation = "uksouth"

##############################################################################################################################################

################ Policy initiative ##########################

##############################################################################################################################################

policies_initiative = [
  {
    policysetDefinitionCategory = "Storage-Access-Policy-Sandpit"
    initiativeName              = "EIT-Management-MG-StorageAccess"
    policyType                  = "Custom"
    initiativeDisplayName       = "StorageAccess Policy Initiative to Management Groups"
    initiativeDescription       = "StorageAccess Policy Initiative to Management Groups"
    management_group_name       = "Staging"

    listOfPolicies = [
      {
        policyId = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
        parameters = {
          effect = "Deny"
        }
      },
      {
        policyId = "/providers/Microsoft.Authorization/policyDefinitions/4fa4b6c0-31ca-4c0d-b10d-24b96f62a751"
        parameters = {
          effect = "deny"
        }
      },
      {
        policyId = "/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c"
        parameters = {
          effect = "Deny"
        }
      }
    ]
    parameters = null
  }
]

##############################################################################################################################################

################ Policy Assignment ##########################

##############################################################################################################################################

policies_assignment = [
  {
    mgpolicyassignment   = "StorageAccess"
    management_group_id  = "/providers/Microsoft.Management/managementgroups/Staging"
    policy_definition_id = "/providers/Microsoft.Management/managementgroups/Staging/providers/Microsoft.Authorization/policySetDefinitions/EIT-Management-MG-StorageAccess"
    description          = "EIT-Management-MG-StorageAccess"
    display_name         = "EIT-Management-MG-StorageAccess"
    location             = "uksouth"
    category             = "Storage"
    enforce              = "false"
    not_scopes           = []
    identity             = "SystemAssigned"
  }
]
