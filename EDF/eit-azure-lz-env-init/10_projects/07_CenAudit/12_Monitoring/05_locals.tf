locals {
  data_source_id = data.azurerm_key_vault_secret.laworkspaceId.value

  timeouts = [{
    create = null
    delete = null
    read   = null
    update = null
  }]

  trigger = [{
    operator  = "GreaterThan"
    threshold = 0
  }]

  action = [{
    action_group = [module.az-action-group.id]

    custom_webhook_payload = null
    email_subject          = "Security_alerts"
  }]

  query1 = <<-QUERY
    AzureActivity
  | where Properties has "Network interfaces should not have public IPs"
  | where Level == ```Error```

 QUERY

  query2 = <<-QUERY
    let policyDefId = '06a78e20-9358-41c9-923c-fb736d382a4d'; AzureActivity
  | where Category == 'Policy' and Level != 'Informational' | extend p=todynamic(Properties) | extend policies=todynamic(tostring(p.policies)) | mvexpand policy = policies
  | where policy.policyDefinitionName in (policyDefId) and p.isComplianceCheck == 'False'

 QUERY

  query3 = <<-QUERY
    let policyDefId = 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'; AzureActivity
  | where Category == 'Policy' and Level != 'Informational' | extend p=todynamic(Properties) | extend policies=todynamic(tostring(p.policies)) | mvexpand policy = policies
  | where policy.policyDefinitionName in (policyDefId) and p.isComplianceCheck == 'False'

 QUERY

  query4 = <<-QUERY
    let policyDefId = '2c89a2e5-7285-40fe-afe0-ae8654b92fb2'; AzureActivity
  | where Category == 'Policy' and Level != 'Informational' | extend p=todynamic(Properties) | extend policies=todynamic(tostring(p.policies)) | mvexpand policy = policies
  | where policy.policyDefinitionName in (policyDefId) and p.isComplianceCheck == 'False'

 QUERY

  query5 = <<-QUERY
    let policyDefId = '9b597639-28e4-48eb-b506-56b05d366257'; AzureActivity
  | where Category == 'Policy' and Level != 'Informational' | extend p=todynamic(Properties) | extend policies=todynamic(tostring(p.policies)) | mvexpand policy = policies
  | where policy.policyDefinitionName in (policyDefId) and p.isComplianceCheck == 'False'

 QUERY

  query6 = <<-QUERY
    AzureActivity
    | where Authorization has "Microsoft.Network/routeTables/routes/delete" or Authorization has "Microsoft.Network/routeTables/routes/write"

 QUERY

  query7 = <<-QUERY
    AzureActivity
    | where Authorization has "Microsoft.Network/networkSecurityGroups/securityRules/write" or Type matches regex "22"

 QUERY

  query8 = <<-QUERY
    AzureActivity
    | where Authorization has "Microsoft.Network/networkSecurityGroups/securityRules/write" or Type matches regex "3389"

 QUERY

  query9 = <<-QUERY
    AzureActivity
    | where Properties has "Key Vault should use a virtual network service endpoint"
    | where Properties has "false"

 QUERY

  query10 = <<-QUERY
    AzureActivity
    | where Properties has "Storage Accounts should use a virtual network service endpoint"
    | where Properties has "false"
    | where Level == ```Warning```

 QUERY

  query11 = <<-QUERY
    let policyDefId = '7796937f-307b-4598-941c-67d3a05ebfe7'; AzureActivity
  | where Category == 'Policy' and Level != 'Informational' | extend p=todynamic(Properties) | extend policies=todynamic(tostring(p.policies)) | mvexpand policy = policies
  | where policy.policyDefinitionName in (policyDefId) and p.isComplianceCheck == 'False'

 QUERY

  query12 = <<-QUERY
    _LogOperation
    | where Operation has "Workspace Configuration"
    | where Detail has "Data retention changed"

 QUERY

  query13 = <<-QUERY
    AzureActivity
    | where Properties has "Microsoft.Storage/storageAccounts"
    | where parse_json(tostring(parse_json(tostring(parse_json(Properties).requestbody)).properties)).allowBlobPublicAccess == true

 QUERY

  query14 = <<-QUERY
    AzureActivity
    | where Properties has "Secure transfer to storage accounts should be enabled"
    | where Level == ```Error```

 QUERY

  query15 = <<-QUERY
    let policyDefId = '013e242c-8828-4970-87b3-ab247555486d'; AzureActivity
  | where Category == 'Policy' and Level != 'Informational' | extend p=todynamic(Properties) | extend policies=todynamic(tostring(p.policies)) | mvexpand policy = policies
  | where policy.policyDefinitionName in (policyDefId) and p.isComplianceCheck == 'False'

 QUERY

  query16 = <<-QUERY
    AzureActivity
    | where Authorization has "Microsoft.Authorization/roleAssignments/write"
    | where Properties_d has "8e3af657-a8ff-443c-a75c-2fe8c4bcb635"

 QUERY

  query17 = <<-QUERY
    AzureDiagnostics
    | where ResourceProvider == "MICROSOFT.KEYVAULT" and Category has "AuditEvent"
    | where properties_enablePurgeProtection_b and Category has "false"

 QUERY

  query18 = <<-QUERY
    AzureActivity
    | where Authorization has "Microsoft.KeyVault/vaults/delete"
    | where OperationName has "Delete Key Vault"

 QUERY

  query19 = <<-QUERY
    let policyDefId = '3657f5a0-770e-44a3-b44e-9431ba1e9735'; AzureActivity
  | where Category == 'Policy' and Level != 'Informational' | extend p=todynamic(Properties) | extend policies=todynamic(tostring(p.policies)) | mvexpand policy = policies
  | where policy.policyDefinitionName in (policyDefId) and p.isComplianceCheck == 'False'

 QUERY

  #    query20                   = <<-QUERY
  #     AzureActivity
  #   | where Authorization has "Microsoft.KeyVault/vaults/delete"
  #   | where OperationName has "Delete Key Vault"
  #  QUERY

  #    query21                   = <<-QUERY
  #     AzureActivity
  #   | where Authorization has "Microsoft.KeyVault/vaults/delete"
  #   | where OperationName has "Delete Key Vault"
  #  QUERY

  #    query22                   = <<-QUERY
  #     AzureActivity
  #   | where Authorization has "Microsoft.KeyVault/vaults/delete"
  #   | where OperationName has "Delete Key Vault"
  #  QUERY
}
