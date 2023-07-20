##############################################################################################################################################

######### Creation of custom policies for centralize DNS zone SS    ###########

##############################################################################################################################################

dns_policies = [
  {
    policyname            = "Deny-Publicendpoint-Storage"
    policy_type           = "Custom"
    policymode            = "All"
    display_name          = "Prevent Storage Account from creating a public endpoint"
    description           = "Prevent Storage Account from creating a public endpoint"
    management_group_name = "26d7416c-60a0-4f2f-ac2d-9afd52fa532c"

    metadata = <<METADATA
    {
    "category": "Storage"
    }
  METADATA

    policy_rule = <<POLICY_RULE
    {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Storage/storageAccounts"
        },
        {
          "field": "Microsoft.Storage/storageAccounts/networkAcls.defaultAction",
          "notequals": "Deny"
        }
      ]
    },
    "then": {
      "effect": "Deny"
    }
  }
 POLICY_RULE
  },
  {
    policyname            = "Deny-Publicendpoint-Keyvault"
    policy_type           = "Custom"
    policymode            = "All"
    display_name          = "Prevent Azure Key Vault from creating a public endpoint"
    description           = "Prevent Azure Key Vault from creating a public endpoint"
    management_group_name = "26d7416c-60a0-4f2f-ac2d-9afd52fa532c"

    metadata = <<METADATA
    {
    "category": "Keyvault"
    }
  METADATA

    policy_rule = <<POLICY_RULE
    {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.KeyVault/vaults"
        },
        {
          "field": "Microsoft.KeyVault/vaults/networkAcls.defaultAction",
          "notequals": "Deny"
        }
      ]
    },
    "then": {
      "effect": "Deny"
    }
  }
 POLICY_RULE
  },
  {
    policyname            = "Deny-DnsZonecreation-PrivateDNS"
    policy_type           = "Custom"
    policymode            = "All"
    display_name          = "Prevent creation of private DNS zones with the `privatelink` prefix"
    description           = "Prevent creation of private DNS zones with the `privatelink` prefix"
    management_group_name = "26d7416c-60a0-4f2f-ac2d-9afd52fa532c"

    metadata    = <<METADATA
    {
    "category": "privateDnsZones"
    }
  METADATA
    policy_rule = <<POLICY_RULE
    {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Network/privateDnsZones"
        },
        {
          "field": "name",
          "contains": "privatelink."
        }
      ]
    },
    "then": {
      "effect": "Deny"
    }
  }
 POLICY_RULE
  },
  {
    policyname            = "recordcreation-PrivateDNS"
    policy_type           = "Custom"
    policymode            = "All"
    display_name          = "Create the required DNS record in the central private DNS zone automatically policy"
    description           = "Create the required DNS record in the central private DNS zone automatically policy"
    management_group_name = "26d7416c-60a0-4f2f-ac2d-9afd52fa532c"

    metadata    = <<METADATA
    {
    "category": "privateDnsrecord"
    }
  METADATA
    policy_rule = <<POLICY_RULE
{
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Network/privateEndpoints"
        },
        {
          "count": {
            "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
            "where": {
              "anyOf": [
                {
                 "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                 "equals": "blob"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "vaultcore"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "azure"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "database"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "datafactory"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "dev"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "dfs"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "file"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "queue"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "sql"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "web"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "table"
                },
                {
                "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
                "equals": "vault"
                }
                ]
            }
          },
          "greaterOrEquals": 1
        }
      ]
    },
    "then": {
      "effect": "deployIfNotExists",
      "details": {
        "type": "Microsoft.Network/privateEndpoints/privateDnsZoneGroups",
        "roleDefinitionIds": [
          "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
        ],
        "deployment": {
          "properties": {
            "mode": "incremental",
            "template": {
              "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
              "contentVersion": "1.0.0.0",
              "parameters": {
                "privateDnsZoneId": {
                  "type": "string"
                },
                "privateEndpointName": {
                  "type": "string"
                },
                "location": {
                  "type": "string"
                }
              },
              "resources": [
                {
                  "name": "[concat(parameters('privateEndpointName'), '/deployedByPolicy')]",
                  "type": "Microsoft.Network/privateEndpoints/privateDnsZoneGroups",
                  "apiVersion": "2021-05-01",
                  "location": "[parameters('location')]",
                  "properties": {
                    "privateDnsZoneConfigs": [
                      {
                        "name": "paasrecord-privateDnsZone",
                        "properties": {
                          "privateDnsZoneId": "[parameters('privateDnsZoneId')]"
                        }
                      }
                    ]
                  }
                }
              ]
            },
            "parameters": {
              "privateDnsZoneId": {
                "type": "String",
                "metadata": {
                  "displayName": "privateDnsZoneId",
                  "strongType": "Microsoft.Network/privateDnsZones"
                 }
              },
              "privateEndpointName": {
                "value": "[field('name')]"
              },
              "location": {
                "value": "[field('location')]"
              }
            }
          }
        }
      }
    }
  }
POLICY_RULE
  }
]

##############################################################################################################################################

################ Policy initiative ##########################

##############################################################################################################################################

dns_policies_initiative = [
  {
    policysetDefinitionCategory = "PaaS"
    initiativeName              = "GEN-Generation-MG-PrivateDNS"
    policyType                  = "Custom"
    initiativeDisplayName       = "Policy Initiative to Generation' Management Group"
    initiativeDescription       = "Policy Initiative to Generation' Management Group"
    management_group_name       = "26d7416c-60a0-4f2f-ac2d-9afd52fa532c"

    listOfPolicies = [
      {
        policyId   = "/providers/Microsoft.Management/managementgroups/26d7416c-60a0-4f2f-ac2d-9afd52fa532c/providers/Microsoft.Authorization/policyDefinitions/Deny-DnsZonecreation-PrivateDNS"
        parameters = {}
      },
      {
        policyId   = "/providers/Microsoft.Management/managementgroups/26d7416c-60a0-4f2f-ac2d-9afd52fa532c/providers/Microsoft.Authorization/policyDefinitions/Deny-Publicendpoint-Storage"
        parameters = {}
      },
      {
        policyId   = "/providers/Microsoft.Management/managementgroups/26d7416c-60a0-4f2f-ac2d-9afd52fa532c/providers/Microsoft.Authorization/policyDefinitions/recordcreation-PrivateDNS"
        parameters = {}
      },
      {
        policyId   = "/providers/Microsoft.Management/managementgroups/26d7416c-60a0-4f2f-ac2d-9afd52fa532c/providers/Microsoft.Authorization/policyDefinitions/Deny-Publicendpoint-Keyvault"
        parameters = {}
      },
      {
        policyId = "/providers/Microsoft.Authorization/policyDefinitions/28b0b1e5-17ba-4963-a7a4-5a1ab4400a0b"
        parameters = {
          effect = "Disabled"
        }
      },
      {
        policyId = "/providers/Microsoft.Authorization/policyDefinitions/1cf164be-6819-4a50-b8fa-4bcaa4f98fb6"
        parameters = {
          effect = "Deny"
        }
      },
      {
        policyId = "/providers/Microsoft.Authorization/policyDefinitions/38d8df46-cf4e-4073-8e03-48c24b29de0d"
        parameters = {
          effect = "Deny"
        }
      }
    ]
    parameters = null
  }
]

##############################################################################################################################################

################ Policy Assignment ############################

##############################################################################################################################################

dns_policies_assignment = [
  {
    mgpolicyassignment   = "GEN-PrivateDNS"
    management_group_id  = "/providers/Microsoft.Management/managementGroups/26d7416c-60a0-4f2f-ac2d-9afd52fa532c"
    policy_definition_id = "/providers/Microsoft.Management/managementgroups/26d7416c-60a0-4f2f-ac2d-9afd52fa532c/providers/Microsoft.Authorization/policySetDefinitions/GEN-Generation-MG-PrivateDNS"
    description          = "GEN-Generation-MG-PrivateDNS"
    display_name         = "GEN-Generation-MG-PrivateDNS"
    location             = "uksouth"
    category             = "Storage"
    enforce              = "false"
    not_scopes = ["/subscriptions/3fd1595c-bc33-465f-ab68-7b3718f5bc1b/resourceGroups/.security",
      "/subscriptions/3fd1595c-bc33-465f-ab68-7b3718f5bc1b/resourceGroups/.terraformBootstrap",
      "/subscriptions/456fef70-5c83-43e9-8e57-31b672add093/resourceGroups/.security",
      "/subscriptions/456fef70-5c83-43e9-8e57-31b672add093/resourceGroups/.terraformBootstrap",
      "/subscriptions/47896f87-9a46-4cac-8287-1f63e4629d57/resourceGroups/.security",
      "/subscriptions/47896f87-9a46-4cac-8287-1f63e4629d57/resourceGroups/.terraformBootstrap",
      "/subscriptions/4b9edf41-1db9-4a5b-a3d8-da0f5d4d02b7/resourceGroups/.security",
      "/subscriptions/4b9edf41-1db9-4a5b-a3d8-da0f5d4d02b7/resourceGroups/.terraformBootstrap",
      "/subscriptions/5fbd936a-842f-4fdb-aa78-6824b52d4559/resourceGroups/.security",
      "/subscriptions/5fbd936a-842f-4fdb-aa78-6824b52d4559/resourceGroups/.terraformBootstrap",
      "/subscriptions/647e7534-fbb5-41cd-ac00-c5d62e6281ad/resourceGroups/.security",
      "/subscriptions/647e7534-fbb5-41cd-ac00-c5d62e6281ad/resourceGroups/.terraformBootstrap",
      "/subscriptions/808e7f86-2f67-40b1-bd80-ab0c15888468/resourceGroups/.security",
      "/subscriptions/808e7f86-2f67-40b1-bd80-ab0c15888468/resourceGroups/.terraformBootstrap",
      "/subscriptions/926e3e9f-39d2-46fb-bc24-06b62d9c1e73/resourceGroups/.security",
      "/subscriptions/926e3e9f-39d2-46fb-bc24-06b62d9c1e73/resourceGroups/.terraformBootstrap",
      "/subscriptions/92a973d3-949e-4ce5-8256-43c437bcf052/resourceGroups/.security",
      "/subscriptions/92a973d3-949e-4ce5-8256-43c437bcf052/resourceGroups/.terraformBootstrap",
      "/subscriptions/b6669f3c-fa73-4d61-89ab-c4135932a15e/resourceGroups/.security",
      "/subscriptions/b6669f3c-fa73-4d61-89ab-c4135932a15e/resourceGroups/.terraformBootstrap",
      "/subscriptions/d07f9e3b-7714-4fbf-8fd8-55cf7bb252f9/resourceGroups/.security",
      "/subscriptions/d07f9e3b-7714-4fbf-8fd8-55cf7bb252f9/resourceGroups/.terraformBootstrap",
      "/subscriptions/db6d757e-9b27-48ee-b91a-ef332b19ae33/resourceGroups/.security",
      "/subscriptions/db6d757e-9b27-48ee-b91a-ef332b19ae33/resourceGroups/.terraformBootstrap",
      "/subscriptions/f4955865-079f-40c6-819e-c979cbbe4619/resourceGroups/.security",
      "/subscriptions/f4955865-079f-40c6-819e-c979cbbe4619/resourceGroups/.terraformBootstrap",
      "/subscriptions/fcf86f0b-4ad6-436f-a067-6bb065b88df4/resourceGroups/.security",
      "/subscriptions/fcf86f0b-4ad6-436f-a067-6bb065b88df4/resourceGroups/.terraformBootstrap",
    ]
    identity = "SystemAssigned"
  }
]
