##############################################################################################################################################

################ Policy initiative ##########################

##############################################################################################################################################

policies_initiative = [
  {
    policysetDefinitionCategory = "Storage-Access-Policy-LZ"
    initiativeName              = "EIT-LZ-MG-StorageAccessPolicy"
    policyType                  = "Custom"
    initiativeDisplayName       = "StorageAccess Policy Initiative LZ Management Groups"
    initiativeDescription       = "StorageAccess Policy Initiative LZ Management Groups"
    management_group_name       = "52cf3c80-3edc-4d03-9920-945094a5e477"

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
  },
  {
    policysetDefinitionCategory = "Storage-Access-Policy-Platform"
    initiativeName              = "EIT-Platform-MG-StorageAccessPolicy"
    policyType                  = "Custom"
    initiativeDisplayName       = "StorageAccess Policy Initiative Platform Management Groups"
    initiativeDescription       = "StorageAccess Policy Initiative Platform Management Groups"
    management_group_name       = "118ae361-3b21-4d81-9b41-d622aad6a019"

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
    mgpolicyassignment   = "Storage-Management"
    management_group_id  = "/providers/Microsoft.Management/managementgroups/cb471d25-27ff-42ea-8ac9-b9464eddd8b0"
    policy_definition_id = "/providers/Microsoft.Management/managementgroups/118ae361-3b21-4d81-9b41-d622aad6a019/providers/Microsoft.Authorization/policySetDefinitions/EIT-Platform-MG-StorageAccessPolicy"
    description          = "EIT-Management-MG-StorageAccess"
    display_name         = "EIT-Management-MG-StorageAccess"
    location             = "uksouth"
    category             = "Storage"
    enforce              = "false"
    not_scopes           = []
    identity             = "SystemAssigned"
  },
  {
    mgpolicyassignment   = "Storage-Generation"
    management_group_id  = "/providers/Microsoft.Management/managementgroups/26d7416c-60a0-4f2f-ac2d-9afd52fa532c"
    policy_definition_id = "/providers/Microsoft.Management/managementgroups/52cf3c80-3edc-4d03-9920-945094a5e477/providers/Microsoft.Authorization/policySetDefinitions/EIT-LZ-MG-StorageAccessPolicy"
    description          = "EIT-Generation-MG-StorageAccess"
    display_name         = "EIT-Generation-MG-StorageAccess"
    location             = "uksouth"
    category             = "Storage"
    enforce              = "false"
    not_scopes           = []
    identity             = "SystemAssigned"
  },
  {
    mgpolicyassignment   = "Storage-Corporate"
    management_group_id  = "/providers/Microsoft.Management/managementgroups/ef19d041-0db8-4219-99e2-9f832c5711ce"
    policy_definition_id = "/providers/Microsoft.Management/managementgroups/52cf3c80-3edc-4d03-9920-945094a5e477/providers/Microsoft.Authorization/policySetDefinitions/EIT-LZ-MG-StorageAccessPolicy"
    description          = "EIT-Corporate-MG-StorageAccess"
    display_name         = "EIT-Corporate-MG-StorageAccess"
    location             = "uksouth"
    category             = "Storage"
    enforce              = "false"
    not_scopes           = []
    identity             = "SystemAssigned"
  },
  {
    mgpolicyassignment   = "Storage-EnterpriseIT"
    management_group_id  = "/providers/Microsoft.Management/managementgroups/30de5789-6067-49d9-99aa-08187c09c3cf"
    policy_definition_id = "/providers/Microsoft.Management/managementgroups/52cf3c80-3edc-4d03-9920-945094a5e477/providers/Microsoft.Authorization/policySetDefinitions/EIT-LZ-MG-StorageAccessPolicy"
    description          = "EIT-EnterpriseIT-MG-StorageAccess"
    display_name         = "EIT-EnterpriseIT-MG-StorageAccess"
    location             = "uksouth"
    category             = "Storage"
    enforce              = "false"
    not_scopes           = []
    identity             = "SystemAssigned"
  }
]
