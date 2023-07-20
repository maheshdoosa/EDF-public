KvName   = "avmeitprdhsmngdsub01kv"
KvRgName = ".security"
############# AVM SA ####################
avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "UK South"
avmsa                  = "avmeitprdhsmngdsub01tf"
avmsa_accounttier      = "standard"
avmsa_storagetype      = "StorageV2"
avmsa_accountreptype   = "LRS"
avmsa_tlsversion       = "TLS1_2"
avmsa_accesstier       = "Hot"
avmsa_httpstraffic     = "true"
avmsa_publicaccess     = "false"
avmsa_hnsenable        = "false"
avmsa_nfsv3            = "false"
avmsa_largefileshare   = "false"
avmsa_acl              = "Allow"
avmsa_bypass           = ["AzureServices"]
avmsa_routing          = "MicrosoftRouting"
avmsa_publishinternet  = "false"
avmsa_publishmicrosoft = "false"
avmsaca                = "statefiles"
environment            = "Production EAM"

#### SA PE #################
sa_private_dns_zone_name    = "privatelink.blob.core.windows.net"
avmsa_endpoint_name         = "avmeitprdhsmngdsub01tf-pe"
eitmngdpeSubnetName         = "eit-uks-prd-hs-pep-snet-01"
eitmngdVnetName             = "eit-uks-prd-hs-mngd-vnet-01"
eitmngdNetworkingRgName     = "eit-uks-prd-hs-mngd-vnet-rg-01"
avmsa_endpoint_SC           = "avmeitprdhsmngdsub01tf-pesc"
is_manual_connection        = "false" //keep default false
sapep_subresource_names     = ["blob"]

########## Storage account diag settings ##########
categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90

category1 = "StorageRead"
category2 = "StorageWrite"
category3 = "StorageDelete"
category4 = "Transaction"
