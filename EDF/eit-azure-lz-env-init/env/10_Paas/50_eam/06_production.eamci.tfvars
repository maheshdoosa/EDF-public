environment = "Production"

#cenadt key vault
eamciKvName   = "avmgenprdhscisub01kv"
eamciKvRgName = ".security"

###########################################################################
############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "uksouth"
avmsa                  = "avmgenprdhscisub01tf"
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
avmsa_acl              = "Deny"
avmsa_bypass           = ["AzureServices"]
avmsa_routing          = "MicrosoftRouting"
avmsa_publishinternet  = "false"
avmsa_publishmicrosoft = "false"
avmsaca                = "statefiles"
############# lawsa SA ####################

lawsaRgName               = "gen-uks-prd-hs-law-rg"
lawsaResourceLocation     = "uksouth"
lawsa                     = "genuksprdhslawsa01"
lawsa_accounttier         = "standard"
lawsa_storagetype         = "StorageV2"
lawsa_accountreptype      = "RAGRS"
lawsa_tlsversion          = "TLS1_2"
lawsa_accesstier          = "Hot"
lawsa_httpstraffic        = "true"
lawsa_publicaccess        = "false"
lawsa_hnsenable           = "false"
lawsa_nfsv3               = "false"
lawsa_largefileshare      = "false"
lawsa_acl                 = "Deny"
lawsa_bypass              = ["AzureServices"]
lawsa_routing             = "MicrosoftRouting"
lawsa_publishinternet     = "false"
lawsa_publishmicrosoft    = "false"
lawsaca                   = "statefiles"
lawsa_blobsoftdelete      = "90"
lawsa_containersoftdelete = "90"
lawsa_sharesoftdelete     = "90"

#### SA PE #################
sa_private_dns_zone_name = "privatelink.blob.core.windows.net"
avmsa_endpoint_name      = "avmgenprdhscisub01tf-pe"
eamcipeSubnetName        = "gen-uks-prd-hs-ci-pep-snet-01"
eamciVnetName            = "gen-uks-prd-hs-ci-vnet-01"
eamciNetworkingRgName    = "gen-uks-prd-hs-ci-vnet-rg-01"
avmsa_endpoint_SC        = "avmgenprdhscisub01tf-pesc"
is_manual_connection     = "false" //keep default false
sapep_subresource_names  = ["blob"]

lawsa_endpoint_name = "genuksprdhslawsa01-pe"
lawsa_endpoint_SC   = "genuksprdhslawsa01-pesc"
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
