environment = "Production"

#cenadt key vault
KvName   = "avmgenprdhsmgmtsub01kv"
KvRgName = ".security"

###########################################################################

####################### Imported Keyvault01

kv_resource_group_name01          = ".security"
resource_Location01               = "uksouth"
keyvault_name01                   = "avmgenprdhsmgmtsub01kv"
sku_name01                        = "standard" // standard or premium HSM
enabled_for_deployment01          = "false"    //true or false   #need to check
enabled_for_disk_encryption01     = "false"    //true or false
enabled_for_template_deployment01 = "false"    //true or false   #need to check
soft_delete_retention_days01      = "90"
purge_protection_enabled01        = "true" //false //true
#diagnosticsetting_name01          = "keyVault-diagnostics"
default_action01 = "Allow"         // Allow will enable access to all networks
bypass01         = "AzureServices" //none

diagnosticsetting_name01 = "keyVault-diagnostics-CentralAudit"
diagnosticsetting_name02 = "keyVault-diagnostics-LogWorkSpace"

diagnostic_logs01 = [
  {
    category = "AuditEvent"
    enabled  = true
    retention_policy = {
      enabled = true
    }
  },
  {
    category = "AzurePolicyEvaluationDetails"
    enabled  = true
    retention_policy = {
      enabled = true
    }
  }
]
diagnostic_metrics01 = [
  {
    category = "AllMetrics"
    enabled  = false

    retention_policy = {
      enabled = false
    }
  }
]
diagnostic_logs02 = [
  {
    category = "AuditEvent"
    enabled  = false
    retention_policy = {
      enabled = false
    }
  },
  {
    category = "AzurePolicyEvaluationDetails"
    enabled  = false
    retention_policy = {
      enabled = false
    }
  }
]
diagnostic_metrics02 = [
  {
    category = "AllMetrics"
    enabled  = true

    retention_policy = {
      enabled = true
    }
  }
]
