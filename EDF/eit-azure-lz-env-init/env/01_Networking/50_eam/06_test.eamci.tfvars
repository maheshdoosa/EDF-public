environment = "Test"

#EamCI key vault
eamCIKvName   = "avmgentsthscisub01kv"
eamCIKvRgName = ".security"

rgs = {
  gen-uks-tst-hs-ci-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}


###################################### Looping through VNets #####################################
vnets = {
  gen-uks-tst-hs-ci-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tst-hs-ci-vnet-rg-01"
    addressSpace  = "eam-ci-vnet-address-range"
    dnsServerList = "hs-tst-dns-ips"
    subnets = {
      gen-uks-tst-hs-ci-ag-snet-01 = {
        enable                    = true
        address                   = "eam-ci-ag-subnet-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-tst-hs-ci-jbox-snet-01 = {
        enable                    = true
        address                   = "eam-ci-jb-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = false
        service_endpoints         = ["Microsoft.Storage"]
      }
      gen-uks-tst-hs-ci-jbox-snet-02 = {
        enable                    = true
        address                   = "eam-ci-jb-subnet-02-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-hs-ci-ds-snet-01 = {
        enable                    = true
        address                   = "eam-ci-ds-subnet-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-tst-hs-ci-pt-snet-01 = {
        enable                    = true
        address                   = "eam-ci-pt-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-hs-ci-law-snet-01 = {
        enable                    = true
        address                   = "eam-ci-law-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
        service_endpoints         = ["Microsoft.Storage"]
      }
      AzureBastionSubnet = {
        enable                    = true
        address                   = "eam-ci-bastion-subnet-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-tst-hs-ci-mgmt-snet-01 = {
        enable                    = true
        address                   = "eam-ci-mgmt-subnet-address-range"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
      gen-uks-tst-hs-ci-ba-snet-01 = {
        enable                    = true
        address                   = "eam-ci-ba-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
        delegation = [
          {
            name = "epndelegation" #(Required) A name for this delegation.
            service_delegation = [
              {
                name    = "Microsoft.ContainerInstance/containerGroups"
                actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
              },
            ]
          },
        ]
      }
      gen-uks-tst-hs-ci-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-CI-TEST-PEP-SNET-SECRET"
        enablePrivateLinkEndPoint = false
        enablePrivateLinkService  = false
      }
    }
  }
}

####################### VNet-Peering #################################

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tst-hs-ci-vnet-01"
    peer2name = "gen-uks-tst-hs-ci-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-tst-hs-ci-vnet-01"
    vnet2rg   = "gen-uks-tst-hs-ci-vnet-rg-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
  }
  peer-hub-spoke-dmz = {
    enable    = false
    peer1name = ""
    vnet1name = ""
    vnet1rg   = ""
    peer2name = ""
    vnet2name = ""
    vnet2rg   = ""
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "lz-transit-SubscriptionId"
spokeSubscriptionId = "eam-ci-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-tst-hs-ci-ag-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-tst-hs-ci-ag-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ag-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-ag-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-ag-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-ci-ag-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-tst-hs-ci-ag-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ag-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-ci-vnet-01"
    RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-ci-jbox-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-tst-hs-ci-jbox-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-jbox-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-jbox-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-jbox-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-ci-jbox-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-tst-hs-ci-jbox-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-jbox-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-ci-vnet-01"
    RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-ci-ds-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-tst-hs-ci-ds-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ds-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-ds-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-ds-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-ci-ds-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-tst-hs-ci-ds-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ds-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-ci-vnet-01"
    RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-ci-pt-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-ci-pt-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-pt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-pt-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-pt-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-ci-pt-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-ci-vnet-01"
    RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-hs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-ci-mgmt-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-ci-mgmt-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-mgmt-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-mgmt-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-mgmt-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-ci-mgmt-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-ci-vnet-01"
    RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eam-hs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-ci-ba-udr-01 = {
    enable = true
    # RouteNames            = ["s_gen-uks-tst-hs-ci-ba-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ba-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-hs-ci-ba-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-hs-ci-ba-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-hs-ci-ba-snet-d_NTP_Internet"]
    RouteNames            = ["s_gen-uks-tst-hs-ci-ba-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-ba-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-ci-vnet-01"
    RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-hs-ci-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-ci-pep-snet-d_On-Prem-Internet", "s_gen-uks-tst-hs-ci-pep-snet-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-ci-vnet-01"
    RGName                = "gen-uks-tst-hs-ci-vnet-rg-01"
    kv_secret_udrprefixes = "eamhs-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-tst-hs-ci-ag-udr-01   = ["gen-uks-tst-hs-ci-ag-snet-01"]
  gen-uks-tst-hs-ci-jbox-udr-01 = ["gen-uks-tst-hs-ci-jbox-snet-01", "gen-uks-tst-hs-ci-jbox-snet-02"]
  gen-uks-tst-hs-ci-ds-udr-01   = ["gen-uks-tst-hs-ci-ds-snet-01"]
  gen-uks-tst-hs-ci-pt-udr-01   = ["gen-uks-tst-hs-ci-pt-snet-01"]
  gen-uks-tst-hs-ci-mgmt-udr-01 = ["gen-uks-tst-hs-ci-mgmt-snet-01"]
  gen-uks-tst-hs-ci-ba-udr-01   = ["gen-uks-tst-hs-ci-ba-snet-01"]
  gen-uks-tst-hs-ci-pep-udr-01  = ["gen-uks-tst-hs-ci-pep-snet-01"]
}

# #################### NSG ################
# nsg = {
#   gen-uks-tst-hs-ci-pep-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   },
#   gen-uks-tst-hs-ci-ag-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   },
#   gen-uks-tst-hs-ci-jbox-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   },
#   gen-uks-tst-hs-ci-ds-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   },
#   gen-uks-tst-hs-ci-pt-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   },
#   gen-uks-tst-hs-ci-law-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   },
#   gen-uks-tst-hs-ci-mgmt-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   },
#   gen-uks-tst-hs-ci-ba-nsg-01 = {
#     enable   = true
#     location = "UK South"
#     rg       = "gen-uks-tst-hs-ci-vnet-rg-01"
#   }
# }

# nsgrules = {
#   gen-uks-tst-hs-ci-pep-nsg-01 = [
#     {
#       direction                                  = "Inbound"
#       priority                                   = "400"
#       name                                       = "AIA-VNET-PEP"
#       description                                = "AIA-VNET-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-VNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
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
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
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
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
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
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-CI-TEST-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "AZUREAGENT-SECRET" // Azure Public IP
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix","destination_address_prefix"]
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
#       source_address_prefix                      = "GEN-CI-TEST-PEP-SNET-SECRET"
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
#       source_address_prefix                      = "GEN-CI-TEST-PEP-SNET-SECRET"
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
#   gen-uks-tst-hs-ci-ag-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-AG-PEP"
#       description                                = "AOA-AG-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-AG-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-tst-hs-ci-jbox-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-JBOX1-PEP"
#       description                                = "AOA-JBOX1-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-JBOX1-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     },
#     {
#       direction                                  = "Outbound"
#       priority                                   = "110"
#       name                                       = "AOA-JBOX2-PEP"
#       description                                = "AOA-JBOX2-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-JBOX2-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-tst-hs-ci-ds-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-DS-PEP"
#       description                                = "AOA-DS-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-DS-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-tst-hs-ci-pt-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-PT-PEP"
#       description                                = "AOA-PT-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-PT-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-tst-hs-ci-law-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-LAW-PEP"
#       description                                = "AOA-LAW-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-LAW-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-tst-hs-ci-mgmt-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-MGMT-PEP"
#       description                                = "AOA-MGMT-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-MGMT-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
#   gen-uks-tst-hs-ci-ba-nsg-01 = [
#     {
#       direction                                  = "Outbound"
#       priority                                   = "100"
#       name                                       = "AOA-BA-PEP"
#       description                                = "AOA-BA-PEP"
#       destination_port_range                     = "443,445"
#       protocol                                   = "tcp"
#       source_port_range                          = "*"
#       source_address_prefix                      = "GEN-CI-TEST-BA-SECRET"
#       source_address_prefixes                    = ""
#       destination_address_prefixes               = ""
#       destination_address_prefix                 = "GEN-CI-TEST-PEP-SNET-SECRET"
#       source_application_security_group_ids      = ""
#       destination_application_security_group_ids = ""
#       access                                     = "Allow"
#       fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
#       fetch_from_asg                             = []
#     }
#   ]
# }

# nsg_subnet_mapping = {
#   gen-uks-tst-hs-ci-pep-nsg-01 = {
#     gen-uks-tst-hs-ci-pep-snet-01 = true
#   }
#   gen-uks-tst-hs-ci-ag-nsg-01 = {
#     gen-uks-tst-hs-ci-ag-snet-01 = true
#   }
#   gen-uks-tst-hs-ci-jbox-nsg-01 = {
#     gen-uks-tst-hs-ci-jbox-snet-01 = true
#     gen-uks-tst-hs-ci-jbox-snet-02 = true
#   }
#   # gen-uks-tst-hs-ci-jbox-nsg-01 = {
#   #   gen-uks-tst-hs-ci-jbox-snet-02 = true
#   # }
#   gen-uks-tst-hs-ci-ds-nsg-01 = {
#     gen-uks-tst-hs-ci-ds-snet-01 = true
#   }
#   gen-uks-tst-hs-ci-pt-nsg-01 = {
#     gen-uks-tst-hs-ci-pt-snet-01 = true
#   }
#   gen-uks-tst-hs-ci-law-nsg-01 = {
#     gen-uks-tst-hs-ci-law-snet-01 = true
#   }
#   gen-uks-tst-hs-ci-mgmt-nsg-01 = {
#     gen-uks-tst-hs-ci-mgmt-snet-01 = true
#   }
#   gen-uks-tst-hs-ci-ba-nsg-01 = {
#     gen-uks-tst-hs-ci-ba-snet-01 = true
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
diag_vnet_name            = "gen-uks-tst-hs-ci-vnet-01"
diag_vnet_rg              = "gen-uks-tst-hs-ci-vnet-rg-01"
