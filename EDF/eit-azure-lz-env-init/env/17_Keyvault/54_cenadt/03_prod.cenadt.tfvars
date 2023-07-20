environment = "Production"

#cenadt key vault
KvName   = "avmeitalzhscenadtsub01kv"
KvRgName = ".security"

###########################################################################

####################### Imported Keyvault01

kv_resource_group_name01          = ".security"
resource_Location01               = "uksouth"
keyvault_name01                   = "avmeitalzhscenadtsub01kv"
sku_name01                        = "standard" // standard or premium HSM
enabled_for_deployment01          = "false"    //true or false   #need to check
enabled_for_disk_encryption01     = "false"    //true or false
enabled_for_template_deployment01 = "false"    //true or false   #need to check
soft_delete_retention_days01      = "90"
purge_protection_enabled01        = "true" //false //true
# diagnosticsetting_name01          = "keyVault-diagnostics"
default_action01 = "Allow"         // Allow will enable access to all networks
bypass01         = "AzureServices" //none



##### Diag Settings #####

category1                      = "AuditEvent"
category2                      = "AzurePolicyEvaluationDetails"
category3                      = "AllMetrics"
categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90
