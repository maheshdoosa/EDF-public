environment = "Production"

#cenadt key vault
eamtstciKvName = "avmgentsthscisub01kv"
eamciKvRgName  = ".security"

###########################################################################
############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "uksouth"
avmsa                  = "avmgentsthscisub01tf"
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
avmsa_acl              = "Allow" // need to Deny after testing
avmsa_bypass           = ["AzureServices"]
avmsa_routing          = "MicrosoftRouting"
avmsa_publishinternet  = "false"
avmsa_publishmicrosoft = "false"
avmsaca                = "statefiles"
############# Law SA ####################

lawsaRgName            = "gen-uks-tst-hs-law-rg"
lawsaResourceLocation  = "uksouth"
lawsa                  = "genukststhslawsa01"
lawsa_accounttier      = "standard"
lawsa_storagetype      = "StorageV2"
lawsa_accountreptype   = "LRS"
lawsa_tlsversion       = "TLS1_2"
lawsa_accesstier       = "Hot"
lawsa_httpstraffic     = "true"
lawsa_publicaccess     = "false"
lawsa_hnsenable        = "false"
lawsa_nfsv3            = "false"
lawsa_largefileshare   = "false"
lawsa_acl              = "Deny"
lawsa_bypass           = ["AzureServices"]
lawsa_routing          = "MicrosoftRouting"
lawsa_publishinternet  = "false"
lawsa_publishmicrosoft = "false"
lawsaca                = "statefiles"
############# Jbox SA ####################

jboxsaRgName            = "gen-uks-tst-hs-ci-jbox-rg"
jboxsaResourceLocation  = "uksouth"
jboxsa                  = "genukststhscijboxrgguest"
jboxsa_accounttier      = "standard"
jboxsa_storagetype      = "StorageV2"
jboxsa_accountreptype   = "LRS"
jboxsa_tlsversion       = "TLS1_2"
jboxsa_accesstier       = "Hot"
jboxsa_httpstraffic     = "true"
jboxsa_publicaccess     = "false"
jboxsa_hnsenable        = "false"
jboxsa_nfsv3            = "false"
jboxsa_largefileshare   = "false"
jboxsa_acl              = "Deny"
jboxsa_bypass           = ["AzureServices"]
jboxsa_routing          = "MicrosoftRouting"
jboxsa_publishinternet  = "false"
jboxsa_publishmicrosoft = "false"
jboxsaca                = "statefiles"

############# devwssa SA ####################

devwssaRgName               = "gen-uks-tst-hs-ci-dev-work-rg"
devwssaResourceLocation     = "uksouth"
devwssa                     = "genukststhsdevws01"
devwssa_accounttier         = "standard"
devwssa_storagetype         = "StorageV2"
devwssa_accountreptype      = "RAGRS"
devwssa_tlsversion          = "TLS1_2"
devwssa_accesstier          = "Hot"
devwssa_httpstraffic        = "true"
devwssa_publicaccess        = "false"
devwssa_hnsenable           = "false"
devwssa_nfsv3               = "false"
devwssa_largefileshare      = "false"
devwssa_acl                 = "Deny"
devwssa_bypass              = ["AzureServices"]
devwssa_routing             = "MicrosoftRouting"
devwssa_publishinternet     = "false"
devwssa_publishmicrosoft    = "false"
devwssaca                   = "statefiles"
devwssa_blobsoftdelete      = "90"
devwssa_containersoftdelete = "90"
devwssa_sharesoftdelete     = "90"
lawsa_sharesoftdelete       = "90"
lawsa_containersoftdelete   = "90"
lawsa_blobsoftdelete        = "90"
jboxsa_blobsoftdelete       = "90"
jboxsa_containersoftdelete  = "90"
jboxsa_sharesoftdelete      = "90"

### SA PE ######
sa_private_dns_zone_name = "privatelink.blob.core.windows.net"
avmsa_endpoint_name      = "avmgentsthscisub01tf-pe"
eamtstcipeSubnetName     = "gen-uks-tst-hs-ci-pep-snet-01"
eamtstciVnetName         = "gen-uks-tst-hs-ci-vnet-01"
eamtstciNetworkingRgName = "gen-uks-tst-hs-ci-vnet-rg-01"
avmsa_endpoint_SC        = "avmgentsthscisub01tf-pesc"
is_manual_connection     = "false" //keep default false
sapep_subresource_names  = ["blob"]

lawsa_endpoint_name = "genukststhslawsa01-pe"
lawsa_endpoint_SC   = "genukststhslawsa01-pesc"

jboxsa_endpoint_name = "genukststhscijboxrgguest-pe"
jboxsa_endpoint_SC   = "genukststhscijboxrgguest-pesc"

devwssa_endpoint_name = "genukststhsdevws01-pe"
devwssa_endpoint_SC   = "genukststhsdevws01-pesc"
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
