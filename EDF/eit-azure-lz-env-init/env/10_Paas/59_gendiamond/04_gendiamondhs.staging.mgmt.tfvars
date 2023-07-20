gendiamondhsKvName   = "avmgenstghscreachsub01kv"
gendiamondhsKvRgName = ".security"

############# Gen stage SA  ####################
environment = "Staging"

genstgSARgName               = ".terraformBootstrap"
genstgSA                     = "avmgenstghscreachsub01tf"
genstgSAResourceLocation     = "uksouth"
genstgSA_accounttier         = "standard"
genstgSA_storagetype         = "StorageV2"
genstgSA_accountreptype      = "LRS"
genstgSA_tlsversion          = "TLS1_2"
genstgSA_accesstier          = "Hot"
genstgSA_httpstraffic        = "true"
genstgSA_publicaccess        = "false"
genstgSA_hnsenable           = "false"
genstgSA_nfsv3               = "false"
genstgSA_largefileshare      = "false"
genstgSA_acl                 = "Deny"
genstgSA_bypass              = ["AzureServices"]
genstgSA_routing             = "MicrosoftRouting"
genstgSA_publishinternet     = "false"
genstgSA_publishmicrosoft    = "false"
genstgSAca                   = "statefiles"
genstgSA_blobsoftdelete      = "90"
genstgSA_containersoftdelete = "90"
genstgSA_sharesoftdelete     = "7"


#### SA PE #################
sa_private_dns_zone_name     = "privatelink.blob.core.windows.net"
genstgsa_endpoint_name       = "avmgenstghscreachsub01tf-pe"
genstgpeSubnetName           = "gen-uks-stg-hs-pep-snet-01"
genstgVnetName               = "gen-uks-stg-creach-vnet-01"
genstgdNetworkingRgName      = "gen-uks-stg-hs-creach-vnet-rg-01"
genstgsa_endpoint_SC         = "avmgenstghscreachsub01tf-pesc"
is_manual_connection         = "false" //keep default false
genstgpep_subresource_names  = ["blob"]
