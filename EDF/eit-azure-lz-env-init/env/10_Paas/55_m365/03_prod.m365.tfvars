environment             = "Production"
m365SubRgName           = "eit-uks-prd-ss-m365-rg"
m365subResourceLocation = "uksouth"

m365SA = "eituksprdssm365sa02"


saprivate_dns_zone_name  = "privatelink.blob.core.windows.net"
m365sa_endpoint_name     = "eituksprdssm365sa02-pe"
m365sa_endpoint_SC       = "eituksprdssm365sa02-pesc"
is_manual_connection     = "false" //keep default false
m365sa_subresource_names = ["blob"]
m365subSSKvName          = "avmeitprdssmngdsub01kv"
m365subSSKvRgName        = ".security"
m365pesubnetName         = "eit-uks-prd-ss-pep-snet-01"
m365VnetName             = "eit-uks-prd-ss-managed-vnet-01"
m365NetworkingRgName     = "eit-uks-prd-ss-managed-vnet-rg-01"
