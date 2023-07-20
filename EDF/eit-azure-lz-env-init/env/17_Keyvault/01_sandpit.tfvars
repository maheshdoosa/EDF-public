environment          = "High Secured Management"
managementHsKvName   = "eitsandstoragesecrets"
managementHsKvRgName = ".security"

kv_resource_group_name = ".security1"
resource_Location      = "uksouth"

keyvault_name                   = "dataeit-sand"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false   #need to check
enabled_for_disk_encryption     = "false"    //true or false
enabled_for_template_deployment = "false"    //true or false   #need to check
soft_delete_retention_days      = "90"
purge_protection_enabled        = "false" //false //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Allow"         // Allow will enable access to all networks
bypass                          = "AzureServices" //none
