environment = "Test"

#EamCI key vault
appSSKvName   = "avmgentstsswkloadsub01kv"
appSSKvRgName = ".security"

rgs = {
  gen-uks-tst-ss-wkload-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}


###################################### Looping through VNets #####################################
vnets = {
  gen-uks-tst-ss-wkload-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tst-ss-wkload-vnet-rg-01"
    addressSpace  = "eam-appSS-vnet-address-range" // Key Vault entry
    dnsServerList = "eam-dns-ips"                  // Key Vault entry
    subnets = {
      gen-uks-tst-ss-eam-bl-snet-01 = {
        enable                    = true
        address                   = "eam-appSS-bl-subnet-address-range" // Key Vault entry
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-ss-eam-cl-snet-01 = {
        enable                    = true
        address                   = "eam-appSS-cl-subnet-address-range" // Key Vault entry
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-ss-eam-it-snet-01 = {
        enable                    = true
        address                   = "eam-appSS-it-subnet-address-range" // Key Vault entry
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-ss-eam-pep-snet-01 = {
        enable                    = true
        address                   = "eam-appss-pep-subnetaddress-range" // Key Vault entry
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tst-ss-wkload-vnet-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
    peer2name = "gen-uks-tst-ss-wkload-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet2name = "gen-uks-tst-ss-wkload-vnet-01"
    vnet2rg   = "gen-uks-tst-ss-wkload-vnet-rg-01"
  },
  peer-ci-spoke = {
    enable    = true
    peer1name = "gen-uks-tst-hs-ci-vnet-01-gen-uks-tst-ss-wkload-vnet-01"
    vnet1name = "gen-uks-tst-hs-ci-vnet-01"
    vnet1rg   = "gen-uks-tst-hs-ci-vnet-rg-01"
    peer2name = "gen-uks-tst-ss-wkload-vnet-01-gen-uks-tst-hs-ci-vnet-01"
    vnet2name = "gen-uks-tst-ss-wkload-vnet-01"
    vnet2rg   = "gen-uks-tst-ss-wkload-vnet-rg-01"
  }
}

tenantId            = "tenantId"
hubSubscriptionId   = "transitSubscriptionId"
spokeSubscriptionId = "subscriptionId"
ciSubscriptionId    = "ciSubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

UDR = {
  gen-uks-tst-ss-eam-bl-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-ss-eam-bl-snet-d_On-Prem-Internet", "s_gen-uks-tst-ss-eam-bl-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-ss-eam-bl-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-ss-eam-bl-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-ss-eam-bl-snet-d_eit-alz-t1int-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-ss-wkload-vnet-01"
    RGName                = "gen-uks-tst-ss-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-ss-eam-cl-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-ss-eam-cl-snet-d_On-Prem-Internet", "s_gen-uks-tst-ss-eam-cl-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-ss-eam-cl-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-ss-eam-cl-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-ss-eam-cl-snet-d_eit-alz-t1int-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-ss-wkload-vnet-01"
    RGName                = "gen-uks-tst-ss-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-ss-eam-it-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-ss-eam-it-snet-d_On-Prem-Internet", "s_gen-uks-tst-ss-eam-it-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-ss-eam-it-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-ss-eam-it-snet-d_eit-uks-alz-hs-mgmt-vnet", "s_gen-uks-tst-ss-eam-it-snet-d_eit-alz-t1int-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "None", "None", "None", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-ss-wkload-vnet-01"
    RGName                = "gen-uks-tst-ss-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "eam-udr-prefixes"
    kv_secret_nexthopIP   = "eam-udr-nexthop"
  }
  gen-uks-tst-ss-eam-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-ss-eam-pep-snet-d_On-Prem-Internet", "s_gen-uks-tst-ss-eam-pep-snet-d_eit-alz-t1int-snet-01"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-ss-wkload-vnet-01"
    RGName                = "gen-uks-tst-ss-wkload-vnet-rg-01"
    kv_secret_udrprefixes = "pep-udr-prefixes"
    kv_secret_nexthopIP   = "pep-udr-nexthop"
  }
}
##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-tst-ss-eam-bl-udr-01  = ["gen-uks-tst-ss-eam-bl-snet-01"]
  gen-uks-tst-ss-eam-cl-udr-01  = ["gen-uks-tst-ss-eam-cl-snet-01"]
  gen-uks-tst-ss-eam-it-udr-01  = ["gen-uks-tst-ss-eam-it-snet-01"]
  gen-uks-tst-ss-eam-pep-udr-01 = ["gen-uks-tst-ss-eam-pep-snet-01"]
}

nsg = {
  gen-uks-tst-ss-eam-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-ss-wkload-vnet-rg-01"
  },
  gen-uks-tst-ss-eam-bl-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-ss-wkload-vnet-rg-01"
  },
  gen-uks-tst-ss-eam-it-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-ss-wkload-vnet-rg-01"
  },
  gen-uks-tst-ss-eam-cl-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-ss-wkload-vnet-rg-01"
  }
}

nsgrules = {
  gen-uks-tst-ss-eam-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AOA-ADDS-PEP"
      description                                = "AOA-ADDS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-PEP"
      description                                = "AIT-WAC-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-PEP"
      description                                = "AIT-AFS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ssafs-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-CA-PEP"
      description                                = "AIT-CA-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-WSUS-PEP"
      description                                = "AIT-WSUS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-wsus-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-ADO-PEP"
      description                                = "AIT-ADO-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIT-MGMT-PEP"
      description                                = "AIT-MGMT-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-AUDIT-PEP"
      description                                = "AIT-AUDIT-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-audit-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-mid-pep-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-tenable-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "sssecgov-pentest-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "910"
      name                                       = "AIT-BL-PEP"
      description                                = "AIT-BL-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appSS-bl-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "920"
      name                                       = "AIT-IT-PEP"
      description                                = "AIT-IT-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appSS-it-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "930"
      name                                       = "AIT-CL-PEP"
      description                                = "AIT-CL-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appSS-cl-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
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
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appss-pep-subnetaddress-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "sssecgov-tenableagent-address"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appss-pep-subnetaddress-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-PEP-AZURECLOUD"
      description                                = "AOT-PEP-AZURECLOUD"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appss-pep-subnetaddress-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appss-pep-subnetaddress-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
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
      priority                                   = "4050"
      name                                       = "DenyAllOutbound"
      description                                = "DenyAllOutbound"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
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
      description                                = "DOA-VNET-INTERNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  gen-uks-tst-ss-eam-bl-nsg-01 = [
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOT-BL-PEP"
      description                                = "AOT-BL-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appSS-bl-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-tst-ss-eam-it-nsg-01 = [
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOT-IT-PEP"
      description                                = "AOT-IT-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appSS-it-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-tst-ss-eam-cl-nsg-01 = [
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOT-CL-PEP"
      description                                = "AOT-CL-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "eam-appSS-cl-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eam-appss-pep-subnetaddress-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
}

nsg_subnet_mapping = {
  gen-uks-tst-ss-eam-pep-nsg-01 = {
    gen-uks-tst-ss-eam-pep-snet-01 = true
  }
  gen-uks-tst-ss-eam-bl-nsg-01 = {
    gen-uks-tst-ss-eam-bl-snet-01 = true
  }
  gen-uks-tst-ss-eam-it-nsg-01 = {
    gen-uks-tst-ss-eam-it-snet-01 = true
  }
  gen-uks-tst-ss-eam-cl-nsg-01 = {
    gen-uks-tst-ss-eam-cl-snet-01 = true
  }
}
