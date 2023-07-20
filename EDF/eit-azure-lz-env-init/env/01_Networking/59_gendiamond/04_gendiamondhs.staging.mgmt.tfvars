environment = "High Secured Staging"

#gendiamondhs key vault
gendiamondhsKvName   = "avmgenstghscreachsub01kv"
gendiamondhsKvRgName = ".security"

###########################################################################

rgs = {
  gen-uks-stg-hs-creach-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "High Secured Staging"
    }
  }
}

vnets = {
  gen-uks-stg-creach-vnet-01 = {
    enable        = true
    rg            = "gen-uks-stg-hs-creach-vnet-rg-01"
    addressSpace  = "gen-uks-stg-hs-creach-vnet-address-range" //key vault secret name as value
    dnsServerList = "gen-uks-stg-hs-creach-vnet-dns-ips"       //key vault secret name as value
    subnets = {
      gen-uks-stg-hs-replicate-snet-01 = {
        enable                    = true
        address                   = "gen-uks-stg-hs-rep-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-testa-snet-01 = {
        enable                    = true
        address                   = "gen-uks-stg-hs-testa-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-testb-snet-01 = {
        enable                    = true
        address                   = "gen-uks-stg-hs-testb-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-agents-snet-01 = {
        enable                    = true
        address                   = "gen-uks-stg-hs-agents-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-stg-hs-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-STG-CREACH-PEP-SNET-SECRET" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

########### UDR #######################
UDR = {
  gen-uks-stg-hs-replicate-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-replicate-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-stg-creach-vnet-01"
    RGName                = "gen-uks-stg-hs-creach-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-stg-hs-testa-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-testa-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-stg-creach-vnet-01"
    RGName                = "gen-uks-stg-hs-creach-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-stg-hs-testb-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-testb-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-stg-creach-vnet-01"
    RGName                = "gen-uks-stg-hs-creach-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"  //key vault secret name as value
  },
  gen-uks-stg-hs-agents-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-agents-snet-01-d_On-Prem-Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    VNetName              = "gen-uks-stg-creach-vnet-01"
    RGName                = "gen-uks-stg-hs-creach-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-agents-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"         //key vault secret name as value
  },
  gen-uks-stg-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-stg-hs-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-stg-hs-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-stg-creach-vnet-01"
    RGName                = "gen-uks-stg-hs-creach-vnet-rg-01"
    kv_secret_udrprefixes = "gendiamondhs-pep-udr-prefixes" //key vault secret name as value//
    kv_secret_nexthopIP   = "gendiamondhs-udr-nexthop"      //key vault secret name as value//
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-stg-hs-replicate-udr-01 = ["gen-uks-stg-hs-replicate-snet-01"]
  gen-uks-stg-hs-testa-udr-01     = ["gen-uks-stg-hs-testa-snet-01"]
  gen-uks-stg-hs-testb-udr-01     = ["gen-uks-stg-hs-testb-snet-01"]
  gen-uks-stg-hs-agents-udr-01    = ["gen-uks-stg-hs-agents-snet-01"]
  gen-uks-stg-hs-pep-udr-01       = ["gen-uks-stg-hs-pep-snet-01"]
}

################# Vnet Peering ################
vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-stg-creach-vnet-01"
    peer2name = "gen-uks-stg-creach-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"      //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"      //hub network
    vnet2rg   = "gen-uks-stg-hs-creach-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-stg-creach-vnet-01"       //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-ss-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-ss-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-ss-mdw-vnet-prd-01" //spoke network
  }
}

tenantId            = "tenantId"              //key vault secret name as value
hubSubscriptionId   = "transitSubscriptionId" //key vault secret name as value
spokeSubscriptionId = "subscriptionId"        //key vault secret name as value

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

############### NSG's ##############
nsg = {
  gen-uks-stg-hs-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-stg-hs-creach-vnet-rg-01"
  },
  gen-uks-stg-hs-testb-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-stg-hs-creach-vnet-rg-01"
  },
  gen-uks-stg-hs-testa-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-stg-hs-creach-vnet-rg-01"
  },
  gen-uks-stg-hs-replicate-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-stg-hs-creach-vnet-rg-01"
  }
}

nsgrules = {
  gen-uks-stg-hs-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-VNET-PEP"
      description                                = "AIA-VNET-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-VNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-PEP"
      description                                = "AIA-SECGOV-MID-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-MID-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-PEP"
      description                                = "AIA-SECGOV-TENABLE-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-TENABLE-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-PEP"
      description                                = "AIA-SECGOV-PENTEST-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "SECGOV-PENTEST-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "DIA-VNET-VNET"
      description                                = "DIA-VNET-VNET"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "Internet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOA-PEP-TENABLEAGENT"
      description                                = "AOA-PEP-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "TENABLEAGENT-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-PEP-AzureAgent"
      description                                = "AOT-PEP-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AZUREAGENT-SECRET" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-PEP-AZURECLOUD"
      description                                = "AOT-PEP-AZURECLOUD"
      destination_port_range                     = "443,445"
      protocol                                   = "TCP"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-PEP-AzureStorage"
      description                                = "AOT-PEP-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "DOA-VNET-VNET"
      description                                = "DOA-VNET-VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET-INTERNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DOA-VNET-INTERNETT"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-stg-hs-testb-nsg-01 = [
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOA-TESTB-PEP"
      description                                = "AOA-TESTB-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-TESTB-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-stg-hs-testa-nsg-01 = [
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOA-TESTA-PEP"
      description                                = "AOA-TESTA-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-TESTA-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-stg-hs-replicate-nsg-01 = [
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOA-REPLICATE-PEP"
      description                                = "AOA-REPLICATE-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-STG-CREACH-REPLICATE-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-STG-CREACH-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
}

nsg_subnet_mapping = {
  gen-uks-stg-hs-pep-nsg-01 = {
    gen-uks-stg-hs-pep-snet-01 = true
  }
  gen-uks-stg-hs-testb-nsg-01 = {
    gen-uks-stg-hs-testb-snet-01 = true
  }
  gen-uks-stg-hs-testa-nsg-01 = {
    gen-uks-stg-hs-testa-snet-01 = true
  }
  gen-uks-stg-hs-replicate-nsg-01 = {
    gen-uks-stg-hs-replicate-snet-01 = true
  }
}

########### NSG Diag Settings ############
category1enabled     = true
retention_policy     = true
retention_policydays = 90
category1            = "NetworkSecurityGroupEvent"
category2            = "NetworkSecurityGroupRuleCounter"
testa_nsg_name       = "gen-uks-stg-hs-testa-nsg-01"
pep_nsg_name         = "gen-uks-stg-hs-pep-nsg-01"
testb_nsg_name       = "gen-uks-stg-hs-testb-nsg-01"
replicate_nsg_name   = "gen-uks-stg-hs-replicate-nsg-01"
nsg_rg_name          = "gen-uks-stg-hs-creach-vnet-rg-01"

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
category3                 = "VMProtectionAlerts"
category4                 = "AllMetrics"
diag_vnet_name            = "gen-uks-stg-creach-vnet-01"
diag_vnet_rg              = "gen-uks-stg-hs-creach-vnet-rg-01"
