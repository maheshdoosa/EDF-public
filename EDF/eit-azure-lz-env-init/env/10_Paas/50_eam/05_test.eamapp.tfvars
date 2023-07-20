environment = "Production"

#cenadt key vault
KvName   = "avmgentsthswkloadsub01kv"
KvRgName = ".security"

eamAppKvName   = "avmgentsthswkloadsub01kv"
eamAppKvRgName = ".security"
###########################################################################
############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "uksouth"
avmsa                  = "avmgentsthswkloadsub01tf"
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

############# shared SA ####################

sharedsaRgName           = "gen-uks-tst-hs-eam-shared-rg"
sharedsaResourceLocation = "uksouth"

############# shared01 SA ####################

sharedsa01RgName            = "gen-uks-tst-hs-eam-shared-rg"
sharedsa01ResourceLocation  = "uksouth"
sharedsa01                  = "genukststhseamsharedrgdi"
sharedsa01_accounttier      = "standard"
sharedsa01_storagetype      = "StorageV2"
sharedsa01_accountreptype   = "LRS"
sharedsa01_tlsversion       = "TLS1_2"
sharedsa01_accesstier       = "Hot"
sharedsa01_httpstraffic     = "true"
sharedsa01_publicaccess     = "false"
sharedsa01_hnsenable        = "false"
sharedsa01_nfsv3            = "false"
sharedsa01_largefileshare   = "false"
sharedsa01_acl              = "Allow"
sharedsa01_bypass           = ["AzureServices"]
sharedsa01_routing          = "MicrosoftRouting"
sharedsa01_publishinternet  = "false"
sharedsa01_publishmicrosoft = "false"
sharedsa01ca                = "statefiles"
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
blobsoftdelete                 = "90"
containersoftdelete            = "90"
sharesoftdelete                = "90"

#### AVM SA PE #################
sa_private_dns_zone_name = "privatelink.blob.core.windows.net"
avmsa_endpoint_name      = "avmgentsthswkloadsub01tf-pe"
eamappSubnetName         = "gen-uks-tst-hs-eam-pep-snet-01"
eamappVnetName           = "gen-uks-tst-hs-wkload-vnet-01"
eamappNetworkingRgName   = "gen-uks-tst-hs-wkload-vnet-rg-01"
avmsa_endpoint_SC        = "avmgentsthswkloadsub01tf-pesc"
is_manual_connection     = "false" //keep default false
sapep_subresource_names  = ["blob"]
