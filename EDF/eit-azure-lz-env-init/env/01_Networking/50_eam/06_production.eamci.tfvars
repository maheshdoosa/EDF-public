environment = "Live"

#EamCI key vault
eamCIKvName   = "avmgenprdhscisub01kv"
eamCIKvRgName = ".security"

rgs = {
  gen-uks-prd-hs-ci-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Live"
    }
  }
  gen-uks-prd-hs-dmz-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Live"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-prd-hs-ci-vnet-01 = {
    enable        = true
    rg            = "gen-uks-prd-hs-ci-vnet-rg-01"
    addressSpace  = "eam-prd-ci-vnet-address-range"
    dnsServerList = "hs-dns-ips" // Ip has been updated based on Private DNS Config
    subnets = {
      gen-uks-prd-hs-ci-ag-snet-01 = {
        enable                    = true
        address                   = "eam-prd-ci-ag-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-ci-jbox-snet-01 = {
        enable                    = true
        address                   = "eam-prd-ci-jb-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-ci-ds-snet-01 = {
        enable                    = true
        address                   = "eam-prd-ci-ds-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-ci-law-snet-01 = {
        enable                    = true
        address                   = "eam-ci-law-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-prd-hs-ci-mgmt-snet-01 = {
        enable                    = true
        address                   = "eam-prd-ci-mgmt-subnet-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-prd-hs-ci-ba-snet-01 = {
        enable                    = true
        address                   = "eam-ci-ba-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
        delegation = [
          {
            name = "bodelegation" #(Required) A name for this delegation.
            service_delegation = [
              {
                name    = "Microsoft.ContainerInstance/containerGroups"
                actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/action"]
              },
            ]
          },
        ] //
      }
      gen-uks-prd-hs-ci-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-CI-PROD-PEP-SNET-SECRET"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-prd-hs-ci-jbox-snet-02 = {
        enable                    = true
        address                   = "eam-prd-ci-jb-subnet02-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
  gen-uks-prd-hs-dmz-vnet-01 = {
    enable        = true
    rg            = "gen-uks-prd-hs-dmz-vnet-rg-01"
    addressSpace  = "eam-prd-dmz-vnet-address-range" //key vault secret
    dnsServerList = "hs-dns-ips"                     // Ip has been updated based on Private DNS Config
    subnets = {
      gen-uks-prd-hs-dmz-ag-snet-01 = {
        enable                    = true
        address                   = "eam-prd-ci-dmz-subnet-address-range" //key vault secret
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
        service_endpoints         = ["Microsoft.Storage"]
      }
    }
  }
}

####################### VNet-Peering #################################

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-ci-vnet-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
    peer2name = "gen-uks-prd-hs-ci-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-prd-hs-ci-vnet-01"
    vnet2rg   = "gen-uks-prd-hs-ci-vnet-rg-01"
  }
  peer-hub-spoke-dmz = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-dmz-vnet-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
    peer2name = "gen-uks-prd-hs-dmz-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-prd-hs-dmz-vnet-01"
    vnet2rg   = "gen-uks-prd-hs-dmz-vnet-rg-01"
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "lz-prd-transit-SubscriptionId"
spokeSubscriptionId = "eam-prd-ci-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-prd-hs-ci-ag-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-ci-ag-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-ag-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-ag-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-ag-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-prd-hs-ci-ag-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-hs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-ci-udr-nexthop"
  }
  gen-uks-prd-hs-ci-jbox-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-prd-hs-ci-jbox-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-prd-hs-ci-jbox-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-prd-hs-ci-jbox-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-jbox-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-jbox-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-jbox-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-ci-udr-nexthop"
  }
  gen-uks-prd-hs-ci-ds-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-ci-ds-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-ds-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-ds-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-ds-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-prd-hs-ci-ds-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-hs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-ci-udr-nexthop"
  }
  gen-uks-prd-hs-dmz-agw-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-dmz-agw-snet_d_gen-uks-prd-hs-ci-vnet-01", "s_gen-uks-prd-hs-dmz-agw-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance", "Internet"]
    VNetName              = "gen-uks-prd-hs-dmz-vnet-01"
    RGName                = "gen-uks-prd-hs-dmz-vnet-rg-01"
    kv_secret_udrprefixes = "eam-prd-ci-dmz-udr-prefixes" //key vault secret
    kv_secret_nexthopIP   = "eam-prd-ci-dmz-udr-nexthop"  //key vault secret
  }
  gen-uks-prd-hs-ci-mgmt-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-ci-mgmt-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-mgmt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-mgmt-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-mgmt-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-prd-hs-ci-mgmt-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-hs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-ci-udr-nexthop"
  }
  gen-uks-prd-hs-ci-ba-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-prd-hs-ci-ba-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-ba-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-prd-hs-ci-ba-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-prd-hs-ci-ba-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-prd-hs-ci-ba-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-prd-hs-ci-ba-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-ba-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-ba-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-ci-udr-nexthop"
  }
  gen-uks-prd-hs-ci-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-prd-hs-ci-pep-snet-d_On-Prem-Internet", "s_gen-uks-prd-hs-ci-pep-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-prd-hs-ci-vnet-01"
    RGName                = "gen-uks-prd-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-ba-udr-prefixes"
    kv_secret_nexthopIP   = "eam-prd-ci-udr-nexthop"
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-prd-hs-ci-ag-udr-01   = ["gen-uks-prd-hs-ci-ag-snet-01"]
  gen-uks-prd-hs-ci-jbox-udr-01 = ["gen-uks-prd-hs-ci-jbox-snet-01", "gen-uks-prd-hs-ci-jbox-snet-02"]
  gen-uks-prd-hs-ci-ds-udr-01   = ["gen-uks-prd-hs-ci-ds-snet-01"]
  gen-uks-prd-hs-dmz-agw-udr-01 = ["gen-uks-prd-hs-dmz-ag-snet-01"]
  gen-uks-prd-hs-ci-mgmt-udr-01 = ["gen-uks-prd-hs-ci-mgmt-snet-01"]
  gen-uks-prd-hs-ci-ba-udr-01   = ["gen-uks-prd-hs-ci-ba-snet-01"]
  gen-uks-prd-hs-ci-pep-udr-01  = ["gen-uks-prd-hs-ci-pep-snet-01"]
}

# #################### NSG ################
# nsg = {
#   gen-uks-prd-hs-ci-pep-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-prd-hs-ci-vnet-rg-01"
#   },
#   gen-uks-prd-hs-ci-ag-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-prd-hs-ci-vnet-rg-01"
#   },
#   gen-uks-prd-hs-ci-jbox-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-prd-hs-ci-vnet-rg-01"
#   },
#   gen-uks-prd-hs-ci-ds-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-prd-hs-ci-vnet-rg-01"
#   },
#   gen-uks-prd-hs-ci-law-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-prd-hs-ci-vnet-rg-01"
#   },
#   gen-uks-prd-hs-ci-mgmt-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-prd-hs-ci-vnet-rg-01"
#   }
#   gen-uks-prd-hs-ci-ba-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-prd-hs-ci-vnet-rg-01"
#   }
# }

# nsgrules = {
#   gen-uks-prd-hs-ci-pep-nsg-01 = [
#     {
#       direction                                  = "Inbound"
#       priority                                   = "400"
#       name                                       = "AIA-VNET-PEP"
#       description                                = "AIA-VNET-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-VNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "800"
#       name                                       = "AIA-SECGOV-MID-PEP"
#       description                                = "AIA-SECGOV-MID-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "SECGOV-MID-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "850"
#       name                                       = "AIA-SECGOV-TENABLE-PEP"
#       description                                = "AIA-SECGOV-TENABLE-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "SECGOV-TENABLE-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "900"
#       name                                       = "AIA-SECGOV-PENTEST-PEP"
#       description                                = "AIA-SECGOV-PENTEST-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "SECGOV-PENTEST-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Inbound"
#       priority                                   = "4000"
#       name                                       = "DIA-VNET-VNET"
#       description                                = "DIA-VNET-VNET"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
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
#       direction                                  = "Inbound"
#       priority                                   = "4096"
#       name                                       = "DIA-INTERNET-VNET"
#       description                                = "DIA-INTERNET-VNET"
#       protocol                                   = "tcp"
#       destination_port_range                     = "443,445"
#       source_port_range                          = "*"
#       source_address_prefix                      = "Internet"
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
#       priority                                   = "550"
#       name                                       = "AOA-PEP-TENABLEAGENT"
#       description                                = "AOA-PEP-TENABLEAGENT"
#       protocol                                   = "tcp"
#       destination_port_range                     = "8834"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "TENABLEAGENT-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "3000"
#       name                                       = "AOT-PEP-AzureAgent"
#       description                                = "AOT-PEP-AzureAgent"
#       destination_port_range                     = "443"
#       protocol                                   = "TCP"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "AZUREAGENT-SECRET" // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "3050"
#       name                                       = "AOT-PEP-AZURECLOUD"
#       description                                = "AOT-PEP-AZURECLOUD"
#       destination_port_range                     = "443,445"
#       protocol                                   = "TCP"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-PEP-SNET-SECRET"
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
#       priority                                   = "3100"
#       name                                       = "AOT-PEP-AzureStorage"
#       description                                = "AOT-PEP-AzureStorage"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "Storage"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "4000"
#       name                                       = "DOA-VNET-VNET"
#       description                                = "DOA-VNET-VNET"
#       destination_port_range                     = "*"
#       protocol                                   = "*"
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
#       priority                                   = "4096"
#       name                                       = "DOA-VNET-INTERNET"
#       protocol                                   = "*"
#       destination_port_range                     = "*"
#       source_port_range                          = "*"
#       source_address_prefix                      = "VirtualNetwork"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "Internet"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Deny"
#       description                                = "DOA-VNET-INTERNETT"
#       fetch_from_kv                              = []
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-prd-hs-ci-ag-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-AG-PEP"
#       description                                = "AOA-AG-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-AG-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-prd-hs-ci-jbox-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-JBOX-PEP"
#       description                                = "AOA-JBOX-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-JBOX-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-prd-hs-ci-ds-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-DS-PEP"
#       description                                = "AOA-DS-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-DS-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-prd-hs-ci-law-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-LAW-PEP"
#       description                                = "AOA-LAW-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-LAW-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-prd-hs-ci-mgmt-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-MGMT-PEP"
#       description                                = "AOA-MGMT-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-MGMT-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-prd-hs-ci-ba-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-BA-PEP"
#       description                                = "AOA-BA-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-PROD-BA-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-PROD-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
# }

# nsg_subnet_mapping = {
#   gen-uks-prd-hs-ci-pep-nsg-01 = {
#     gen-uks-prd-hs-ci-pep-snet-01 = true
#   }
#   gen-uks-prd-hs-ci-ag-nsg-01 = {
#     gen-uks-prd-hs-ci-ag-snet-01 = true
#   }
#   gen-uks-prd-hs-ci-jbox-nsg-01 = {
#     gen-uks-prd-hs-ci-jbox-snet-01 = true
#   }
#   gen-uks-prd-hs-ci-ds-nsg-01 = {
#     gen-uks-prd-hs-ci-ds-snet-01 = true
#   }
#   gen-uks-prd-hs-ci-law-nsg-01 = {
#     gen-uks-prd-hs-ci-law-snet-01 = true
#   }
#   gen-uks-prd-hs-ci-mgmt-nsg-01 = {
#     gen-uks-prd-hs-ci-mgmt-snet-01 = true
#   }
#   gen-uks-prd-hs-ci-ba-nsg-01 = {
#     gen-uks-prd-hs-ci-ba-snet-01 = true
#   }
# }

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
retention_policydays      = 90
category1                 = "VMProtectionAlerts"
category2                 = "AllMetrics"
diag_vnet_name            = "gen-uks-prd-hs-ci-vnet-01"
diag_vnet_rg              = "gen-uks-prd-hs-ci-vnet-rg-01"
