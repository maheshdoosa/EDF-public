KvName   = "avmgentsthsmngdsub01kv"
KvRgName = ".security"

#################### KV ################################

keyvault_name                   = "gen-uks-dev-hs-ade-kv-01" //need to change in prod
resource_Location               = "uk south"
kv_resource_group_name          = "gen-uks-dev-hs-ade-rg-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
# diagnosticsetting_name          = "keyVault-diagnostics"
default_action        = "Deny"          //Allow will enable access to all networks
bypass                = "AzureServices" //none
environment           = "High Secured Managed"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
vnet_dns_link_name    = "gen-uks-dev-hs-ade-kv-pdns-link"
endpoint_name         = "gen-uks-dev-hs-ade-kv-01-pe"
endpoint_SC           = "gen-uks-dev-hs-ade-kv-01-pesc"
is_manual_connection  = "false" //keep default false
subresource_names     = ["vault"]
NetworkingRgName      = "gen-uks-dev-hs-managed-vnet-rg-01"
VnetName              = "gen-uks-dev-hs-managed-vnet-01"
peSubnetName          = "gen-uks-dev-hs-pep-snet-01"
#  aad_group                    = "ad_group"
#  aad_user                     = "svl-az@azure.edfstaging.io"

diagnosticsetting_name01 = "keyVault-diagnostics-CentralAudit01"
diagnosticsetting_name02 = "keyVault-diagnostics-LogWorkSpace01"

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
