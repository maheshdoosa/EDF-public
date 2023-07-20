KvName   = "avmeitsand01kv"
KvRgName = ".security"

#################### KV ################################

keyvault_name                   = "gen-sand-hs-ade-kv-01" //need to change in prod
resource_Location               = "uk south"
kv_resource_group_name          = "gen-uks-dev-hs-ade-rg-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
environment                     = "High Secured Managed"
private_dns_zone_name           = "privatelink.vaultcore.azure.net"
vnet_dns_link_name              = "gen-uks-stg-hs-ade-kv-pdns-link"
endpoint_name                   = "gen-uks-stg-hs-ade-kv-01-pe"
endpoint_SC                     = "gen-uks-stg-hs-ade-kv-01-pesc"
is_manual_connection            = "false" //keep default false
subresource_names               = ["vault"]
NetworkingRgName                = "gen-uks-dev-hs-managed-vnet-rg-01"
VnetName                        = "gen-uks-dev-hs-managed-vnet-01"
peSubnetName                    = "gen-uks-dev-hs-pep-snet-01"
#  aad_group                    = "test_ad_group02_sandpit_for_customrole"
#  aad_group                    = "test_ad_group02_stg_for_customrole "
#  aad_user                     = "netra.lal.bhushal@azure.edfstaging.io"
#  log_analytics_destination_type = "AzureDiagnostics"
