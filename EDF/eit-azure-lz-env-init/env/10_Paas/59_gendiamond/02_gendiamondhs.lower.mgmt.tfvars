#gendiamondhs key vault
gendiamondhsKvName   = "avmgenlwrhswkloadsub01kv"
gendiamondhsKvRgName = ".security"

############# Gen stage SA  ####################

genlwrSARgName               = ".terraformBootstrap"
genlwrSA                     = "avmgenlwrhswkloadsub01tf"
genlwrSAResourceLocation     = "uksouth"
genlwrSA_accounttier         = "standard"
genlwrSA_storagetype         = "StorageV2"
genlwrSA_accountreptype      = "LRS"
genlwrSA_tlsversion          = "TLS1_2"
genlwrSA_accesstier          = "Hot"
genlwrSA_httpstraffic        = "true"
genlwrSA_publicaccess        = "false"
genlwrSA_hnsenable           = "false"
genlwrSA_nfsv3               = "false"
genlwrSA_largefileshare      = "false"
genlwrSA_acl                 = "Deny"
genlwrSA_bypass              = ["AzureServices"]
genlwrSA_routing             = "MicrosoftRouting"
genlwrSA_publishinternet     = "false"
genlwrSA_publishmicrosoft    = "false"
genlwrSAca                   = "statefiles"
genlwrSA_blobsoftdelete      = "90"
genlwrSA_containersoftdelete = "90"
genlwrSA_sharesoftdelete     = "7"

#### SA PE #################
sa_private_dns_zone_name     = "privatelink.blob.core.windows.net"
genlwrsa_endpoint_name       = "avmgenlwrhswkloadsub01tf-pe"
genlwrpeSubnetName           = "gen-uks-lwr-hs-pep-snet-01"
genlwrVnetName               = "gen-uks-lwr-hs-wkload-vnet-01"
genlwrdNetworkingRgName      = "gen-uks-lwr-hs-wkload-vnet-rg-01"
genlwrsa_endpoint_SC         = "avmgenlwrhswkloadsub01tf-pesc"
is_manual_connection         = "false" //keep default false
genlwrpep_subresource_names  = ["blob"]
