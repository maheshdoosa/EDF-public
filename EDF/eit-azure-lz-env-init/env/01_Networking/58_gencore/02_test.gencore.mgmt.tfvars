# environment = "Test"

# #mgmtss key vault
# hssecgovKvName   = "avmeitalzhssecgovsub01kv"
# hssecgovKvRgName = ".security"

# ###########################################################################

# rgs = {
#   eit-uks-alz-hs-secgovprd-vnet-rg-01 = {
#     enable   = true
#     location = "UK South"
#     tags = {
#       environment = "Test"
#     }
#   }
# }

# vnets = {
#   eit-uks-alz-hs-secgovprd-vnet-01 = {
#     enable        = true
#     rg            = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
#     addressSpace  = "secgov-prd-vnet-address-range" //key vault secret name as value
#     dnsServerList = "secgov-prd-dns-ips"            //key vault secret name as value
#     subnets = {
#       eit-alz-hs-midprd-snet-01 = {
#         enable                    = true
#         address                   = "hssecgov-prd-subnet-address-range" //key vault secret name as value
#         enablePrivateLinkEndPoint = true
#         enablePrivateLinkService  = true
#       }
#     }
#   }
# }
# ################# Vnet Peering ################
# vnet_peering = {
#   peer-hub-spoke = {
#     enable    = true
#     peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-alz-hs-secgovprd-vnet-01"
#     peer2name = "eit-uks-alz-hs-secgovprd-vnet-01-eit-uks-alz-transit-vnet-01"
#     vnet1rg   = "eit-uks-alz-transit-vnet-rg"         //hub network resource group
#     vnet1name = "eit-uks-alz-transit-vnet-01"         //hub network
#     vnet2rg   = "eit-uks-alz-hs-secgovprd-vnet-rg-01" //spoke network resource group
#     vnet2name = "eit-uks-alz-hs-secgovprd-vnet-01"    //spoke network
#   },
#   peer-hub-spoke-01 = {
#     enable    = false //dummy
#     peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mdw-vnet-prd-01"
#     peer2name = "gen-uks-prd-hs-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
#     vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
#     vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
#     vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
#     vnet2name = "gen-uks-prd-hs-mdw-vnet-prd-01" //spoke network
#   }
# }

# tenantId            = "tenantId"              //key vault secret name as value
# hubSubscriptionId   = "transitSubscriptionId" //key vault secret name as value
# spokeSubscriptionId = "subscriptionId"        //key vault secret name as value

# AllowVirtualNetworkAccess = true
# AllowForwardedTraffic     = true
# AllowGatewayTransitVNet12 = true
# AllowGatewayTransitVNet21 = false
# UseRemoteGateways         = false

# ########### UDR #######################
# UDR = {
#   eit-alz-hs-midprd-udr-01 = {
#     enable                = true
#     RouteNames            = ["s_eit-alz-hs-midprd-snet-01-d_On-Prem-Internet"]
#     NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
#     VNetName              = "eit-uks-alz-hs-secgovprd-vnet-01"
#     RGName                = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
#     kv_secret_udrprefixes = "hssecgov-udr-prefixes" //key vault secret name as value
#     kv_secret_nexthopIP   = "hssecgov-udr-nexthop"  //key vault secret name as value
#   }
# }

# ##################### UDR association with Subnets #######################
# UDR_Subnet_Mapping = {
#   eit-alz-hs-midprd-udr-01 = ["eit-alz-hs-midprd-snet-01"]
# }

# ############ NSG ########################

# nsg = {
#   eit-alz-hs-midprd-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
#   }
# }

# nsgrules = {
#   eit-alz-hs-midprd-nsg-01 = [
#     {
#       direction                                  = "Inbound"
#       priority                                   = "400"
#       name                                       = "AIA-ADDS-MIDPRD"
#       description                                = "AIA-ADDS-MIDPRD"
#       protocol                                   = "*"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "eit-alz-hs-secgov-adds-01-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "500"
#       name                                       = "AIT-WAC-MIDPRD"
#       description                                = "AIT-WAC-MIDPRD"
#       protocol                                   = "tcp"
#       destination_port_range                     = "5985,3389"
#       source_port_range                          = "*"
#       source_address_prefix                      = "eit-alz-hs-secgov-wac-01-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "hssecgov-prd-subnet-address-range"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "4000"
#       name                                       = "Deny-VNET-VNET"
#       description                                = "Deny-VNET-VNET"
#       protocol                                   = "*"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "VirtualNetwork"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Deny"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "400"
#       name                                       = "AOA-MIDPRD-ADDS"
#       description                                = "AOA-MIDPRD-ADDS"
#       protocol                                   = "*"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "eit-alz-hs-secgov-adds-01-address-range"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "450"
#       name                                       = "AOT-MIDPRDLOGA"
#       description                                = "AOT-MIDPRDLOGA"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "eit-alz-hs-secgov-loga-01-address-range"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "500"
#       name                                       = "AOT-MIDPRD-WSUS"
#       description                                = "AOT-MIDPRD-WSUS"
#       protocol                                   = "tcp"
#       destination_port_range                     = "8530"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "eit-alz-hs-secgov-wsus-01-address-range"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "550"
#       name                                       = "AOT-MIDPRD-INTERNET"
#       description                                = "AOT-MIDPRD-INTERNET"
#       protocol                                   = "*"
#       destination_port_range                     = "80,443"
#       source_port_range                          = "*"
#       source_address_prefix                      = "VirtualNetwork"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "Internet"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "600"
#       name                                       = "AOT-MIDPRD-AzureAgent"
#       description                                = "AOT-MIDPRD-AzureAgent"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "168.63.129.16/32" //public address
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "650"
#       name                                       = "AOT-MIDPRD-AzureCloud"
#       description                                = "AOT-MIDPRD-AzureCloud"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "AzureCloud"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "700"
#       name                                       = "AOT-MIDPRD-KMS"
#       description                                = "AOT-MIDPRD-KMS"
#       protocol                                   = "tcp"
#       destination_port_range                     = "1638"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "23.102.135.246" // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "750"
#       name                                       = "AOT-MIDPRD-DISCOVERY"
#       description                                = "AOT-MIDPRD-DISCOVERY"
#       protocol                                   = "tcp"
#       destination_port_range                     = "21,22,23,25,53,80,110,111,135,137,137,139,161,162,199,389,427,443,445,515,548,636,993,1414,1433,1521,2049,3306,5060,5060,5432,5480,5666,5989,7001,7500,8080,9080,9100,9443,9443,50000"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "eit-alz-hs-secgov-disc-01-address-range"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "800"
#       name                                       = "AOU-MIDPRD-DISCOVERY"
#       description                                = "AOU-MIDPRD-DISCOVERY"
#       protocol                                   = "udp"
#       destination_port_range                     = "53,137,161,162,427,2049"
#       source_port_range                          = "*"
#       source_address_prefix                      = "hssecgov-prd-subnet-address-range"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "eit-alz-hs-secgov-disc-01-address-range"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "4000"
#       name                                       = "Deny_VNET-VNET"
#       description                                = "Deny_VNET-VNET"
#       protocol                                   = "*"
#       destination_port_range                     = "0-65535"
#       source_port_range                          = "*"
#       source_address_prefix                      = "VirtualNetwork"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "VirtualNetwork"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Deny"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     },

#   ]
# }

# nsg_subnet_mapping = {
#   eit-alz-hs-midprd-nsg-01 = {
#     eit-alz-hs-midprd-snet-01 = true
#   }
# }
