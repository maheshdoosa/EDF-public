gendiamondhsKvName   = "avmgenuprhswkloadsub01kv"
gendiamondhsKvRgName = ".security"
############# Gen Upper SA  ####################

genuprSARgName               = ".terraformBootstrap"
genuprSA                     = "avmgenuprhswkloadsub01tf"
genuprSAResourceLocation     = "uksouth"
genuprSA_accounttier         = "standard"
genuprSA_storagetype         = "StorageV2"
genuprSA_accountreptype      = "LRS"
genuprSA_tlsversion          = "TLS1_2"
genuprSA_accesstier          = "Hot"
genuprSA_httpstraffic        = "true"
genuprSA_publicaccess        = "false"
genuprSA_hnsenable           = "false"
genuprSA_nfsv3               = "false"
genuprSA_largefileshare      = "false"
genuprSA_acl                 = "Deny"
genuprSA_bypass              = ["AzureServices"]
genuprSA_routing             = "MicrosoftRouting"
genuprSA_publishinternet     = "false"
genuprSA_publishmicrosoft    = "false"
genuprSAca                   = "statefiles"
genuprSA_blobsoftdelete      = "90"
genuprSA_containersoftdelete = "90"
genuprSA_sharesoftdelete     = "90"

#### SA PE #################
sa_private_dns_zone_name     = "privatelink.blob.core.windows.net"
genuprsa_endpoint_name       = "avmgenuprhswkloadsub01tf-pe"
genuprpeSubnetName           = "gen-uks-upr-hs-pep-snet-01"
genuprVnetName               = "gen-uks-upr-hs-wkload-vnet-01"
genuprdNetworkingRgName      = "gen-uks-upr-hs-wkload-vnet-rg-01"
genuprsa_endpoint_SC         = "avmgenuprhswkloadsub01tf-pesc"
is_manual_connection         = "false" //keep default false
genuprpep_subresource_names  = ["blob"]
