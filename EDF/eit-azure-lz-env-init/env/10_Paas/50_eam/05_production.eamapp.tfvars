environment = "Production"

#cenadt key vault
KvName   = "avmgenprdhswkloadsub01kv"
KvRgName = ".security"

eamAppKvName   = "avmgenprdhswkloadsub01kv"
eamAppKvRgName = ".security"

###########################################################################
############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "uksouth"
avmsa                  = "avmgenprdhswkloadsub01tf"
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

#### SA PE #################
sa_private_dns_zone_name = "privatelink.blob.core.windows.net"
avmsa_endpoint_name      = "avmgenprdhswkloadsub01tf-pe"
eamapppeSubnetName       = "gen-uks-prd-hs-eam-pep-snet-01"
eamappVnetName           = "gen-uks-prd-hs-wkload-vnet-01"
eamappNetworkingRgName   = "gen-uks-prd-hs-wkload-vnet-rg-01"
avmsa_endpoint_SC        = "avmgenprdhswkloadsub01tf-pesc"
is_manual_connection     = "false" //keep default false
sapep_subresource_names  = ["blob"]

########## Storage account diag settings ##########
category1 = "StorageRead"
category2 = "StorageWrite"
category3 = "StorageDelete"
category4 = "Transaction"

categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90
