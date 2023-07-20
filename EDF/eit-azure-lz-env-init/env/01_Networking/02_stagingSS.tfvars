environment = "staging"

#mgmtss key vault
mgmtssKvName   = "mgmtssinfrasecrets"
mgmtssKvRgName = ".security"

###########################################################################

rgs = {
  eit-uks-alz-ss-mgmt-vnet-rg2 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Staging"
    }
  }
}

vnets = {
  eit-uks-alz-ss-mgmt-vnet-01 = {
    enable        = true
    rg            = "eit-uks-alz-ss-mgmt-vnet-rg2"
    addressSpace  = "mgmtss-stg-vnet-address-range"
    dnsServerList = "mgmtss-stg-dns-ips"
    subnets = {
      eit-alz-ss-mgmt-snet-01 = {
        enable  = true
        address = "eit-alz-ss-mgmt-snet-01-address-range"
      }
      eit-alz-ss-adds-snet-01 = {
        enable  = true
        address = "eit-alz-ss-adds-snet-01-address-range"
      }
      eit-alz-ss-wsus-snet-01 = {
        enable  = true
        address = "eit-alz-ss-wsus-snet-01-address-range"
      }
      eit-alz-ss-wac-snet-01 = {
        enable  = true
        address = "eit-alz-ss-wac-snet-01-address-range"
      }
      eit-alz-ss-ca-snet-01 = {
        enable  = true
        address = "eit-alz-ss-ca-snet-01-address-range"
      }
      # eit-alz-ss-audit-snet-01 = {
      #   enable  = true
      #   address = "eit-alz-ss-audit-snet-01-address-range"
      # }

    }
  }
}

UDR = {
  eit-alz-ss-mgmt-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg2"
    RouteNames            = ["s_eit-alz-ss-mgmt-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-stg-mgmt-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-stg-mgmt-udr-nexthop"
  },
  eit-alz-ss-ad-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg2"
    RouteNames            = ["s_eit-alz-ss-ad-snet-d_eit-alz-t1int-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-t1mgmt-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-t2int-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-t2mgmt-snet-01", "s_eit-alz-ss-ad-snet-d_eit-alz-transit-protected-snet-01", "s_eit-alz-ss-ad-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance", "VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-stg-ad-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-stg-ad-udr-nexthop"
  },
  eit-alz-ss-wsus-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg2"
    RouteNames            = ["s_eit-alz-ss-wsus-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-stg-wsus-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-stg-wsus-udr-nexthop"
  },
  eit-alz-ss-wac-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg2"
    RouteNames            = ["s_eit-alz-ss-wac-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-stg-wac-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-stg-wac-udr-nexthop"
  },
  eit-alz-ss-ca-udr-01 = {
    enable                = true
    VNetName              = "eit-uks-alz-ss-mgmt-vnet-01"
    RGName                = "eit-uks-alz-ss-mgmt-vnet-rg2"
    RouteNames            = ["s_eit-alz-ss-ca-snet-d_Internet"]
    NextHopTypes          = ["VirtualAppliance"]
    kv_secret_udrprefixes = "mgmtss-stg-ca-udr-prefixes"
    kv_secret_nexthopIP   = "mgmtss-stg-ca-udr-nexthop"
  },
}

UDR_Subnet_Mapping = {
  eit-alz-ss-mgmt-udr-01 = ["eit-alz-ss-mgmt-snet-01"]
  eit-alz-ss-ad-udr-01   = ["eit-alz-ss-adds-snet-01"]
  eit-alz-ss-wsus-udr-01 = ["eit-alz-ss-wsus-snet-01"]
  eit-alz-ss-wac-udr-01  = ["eit-alz-ss-wac-snet-01"]
  eit-alz-ss-ca-udr-01   = ["eit-alz-ss-ca-snet-01"]
}

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-eit-uks-alz-ss-mgmt-vnet-01"
    peer2name = "eit-uks-alz-ss-mgmt-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1name = "az-lz-test-transit-networking-hub"
    vnet1rg   = "az-lz-test-transit-networking"
    vnet2name = "eit-uks-alz-ss-mgmt-vnet-01"
    vnet2rg   = "eit-uks-alz-ss-mgmt-vnet-rg2"
  }
}

tenantIdSecretKey            = "tenantId"
hubSubscriptionIdSecretKey   = "lz-stg-transit-SubscriptionId"
spokeSubscriptionIdSecretKey = "mgmtss-stg-SubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

############## NSGs ##################
# mgmtss_kvname = "eit-uks-snd-ss-vd-kvt-01"
# mgmtss_kvrg   = "eit-uks-snd-ss-wvd-kvt-rg-01"
# asg_rg = "eit-uks-stg-ss-kvt-rg-01" # Using same rg for all the asg

asg_rg = {
  eit-uks-alz-ss-caweb-asg = "tst-asgs-stg"
  eit-uks-alz-ss-ica-asg   = "tst-asgs-stg"
  eit-uks-alz-ss-adds-asg  = "tst-asgs-stg"
  eit-uks-alz-ss-wac-asg   = "tst-asgs-stg"
}

nsg = {
  eit-uks-alz-ss-mgmt-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg2"
  }
  eit-uks-alz-ss-ca-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg2"
  }
  eit-uks-alz-ss-adds-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "eit-uks-alz-ss-mgmt-vnet-rg2"
  }
}

nsgrules = {
  eit-uks-alz-ss-mgmt-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AllowVnetInBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowVnetInBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "651"
      name                                       = "AllowAzureLoadBalancerInBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "AzureLoadBalancer"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowAzureLoadBalancerInBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "652"
      name                                       = "DenyAllInbound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "DenyAllInbound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "Deny-VNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-mgmt-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "Deny-VNET-VNET"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "655"
      name                                       = "AllowVnetOutBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowVnetOutBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "656"
      name                                       = "AllowInternetOutBound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AllowInternetOutBound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "657"
      name                                       = "DenyAllOutbound"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "*"
      access                                     = "Deny"
      description                                = "DenyAllOutbound"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
    }
  ]
  eit-uks-alz-ss-ca-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIT-PKI-CAWEB-ICA"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-PKI-CAWEB-ICA"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "425"
      name                                       = "AIT-ICA-ASG-RCA"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_application_security_group_ids      = "eit-uks-alz-ss-ica-asg"
      destination_application_security_group_ids = ""
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-rca-dst-prefix01"
      access                                     = "Allow"
      description                                = "AIT-ICA-ASG-RCA"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-PKI-VNET-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-PKI-VNET-CAWEB"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIA-AD-ASG-CAWEB-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIA-AD-ASG-CAWEB-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "525"
      name                                       = "AIA-AD-ASG-ICA-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIA-AD-ASG-ICA-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-BASTION-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-BASTION-CAWEB"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "575"
      name                                       = "AIT-BASTION-ICA"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-BASTION-ICA"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-BASTION-ROOTCA"
      protocol                                   = "tcp"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-bst-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-BASTION-ROOTCA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-WAC-ASG-CAWEB-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AIT-WAC-ASG-CAWEB-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "AIT-WAC-ASG-ICA-ASG"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-ica-asg"
      access                                     = "Allow"
      description                                = "AIT-WAC-ASG-ICA-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "675"
      name                                       = "Deny-VNET_VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "Deny-VNET_VNET"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOT-PKI-ICA-CAWEB"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-ica-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-caweb-asg"
      access                                     = "Allow"
      description                                = "AOT-PKI-ICA-CAWEB"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-CAWEB-LOGAPE"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-CAWEB-LOGAPE"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOA-CAWEB-ASG-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-caweb-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AOA-CAWEB-ASG-AD-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "575"
      name                                       = "AOA-ICA-ASG-AD-ASG"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-ica-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AOA-ICA-ASG-AD-ASG"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2000"
      name                                       = "AOT-PKI_AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-out-pki-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_AzureAgent"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2100"
      name                                       = "AOT-PKI_AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud.UKSouth"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_AzureCloud"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2200"
      name                                       = "AOT-PKI_AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Storage.UKSouth"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_AzureStorage"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-PKI_KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-kms-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_KMS"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2400"
      name                                       = "AOT-PKI_WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-ca-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-wsus-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-PKI_WSUS"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny_Internet"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Deny"
      description                                = "Deny_Internet"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    }
  ]
  eit-uks-alz-ss-adds-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA_AD_AD_Replication"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-adds-nsg-01-aia-src-dst-prefix"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-adds-nsg-01-aia-src-dst-prefix"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-AD-AD-Replication"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT_WACGW_ASG_ADDS_ASG"
      destination_port_range                     = "3389,5985"
      source_port_range                          = "*"
      protocol                                   = "tcp"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-wac-asg"
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AIA-AD-AD-Replication"
      fetch_from_kv                              = []
      fetch_from_asg                             = ["source_application_security_group_ids", "destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT_VNET_ADDS"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "ss-adds-nsg-01-adds-src-prefixes01"
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AIA-AD-AD-Replication"
      fetch_from_kv                              = ["source_address_prefixes"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT_BASTION_ADDS_ASG"
      destination_port_range                     = "3389"
      source_port_range                          = "*"
      protocol                                   = "tcp"
      source_address_prefix                      = "ss-ca-nsg-common-01"
      source_address_prefixes                    = ""
      destination_address_prefix                 = ""
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = "eit-uks-alz-ss-adds-asg"
      access                                     = "Allow"
      description                                = "AIA-AD-AD-Replication"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = ["destination_application_security_group_ids"]
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET_VNET"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      protocol                                   = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefix                 = "VirtualNetwork"
      destination_address_prefixes               = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-AD-AD-Replication"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-AD-AD-Replication"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-ss-adds-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-ss-adds-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOA-AD-AD-Replication"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-ADDS-LOGA"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ss-ca-nsg-common-02"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-audit-snet-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ADDS-LOGA"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOT-ADDS_VNET"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ss-adds-nsg-01-aot-dest-prefixes"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AOT-ADDS_VNET"
      fetch_from_kv                              = ["destination_address_prefixes"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-ADDS_WSUS"
      description                                = "AOT-ADDS_WSUS"
      destination_port_range                     = "8530"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-wsus-snet-01-address-range"
      source_application_security_group_ids      = "eit-uks-alz-ss-adds-asg"
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = ["source_application_security_group_ids"]
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2000"
      name                                       = "AOT-ADDS_AzureAgent"
      description                                = "AOT-ADDS_AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "VirtualNetwork"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2100"
      name                                       = "AOT-ADDS_AzureStorage"
      description                                = "AOT-ADDS_AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud.UKSouth"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2200"
      name                                       = "AOT-ADDS_KMS"
      description                                = "AOT-ADDS_KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "VirtualNetwork"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "ss-ca-nsg-01-kms-dst-prefix01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4000"
      name                                       = "Deny_Internet"
      description                                = "Deny_Internet"
      destination_port_range                     = "*"
      protocol                                   = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "*"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
  ]
}

nsg_subnet_mapping = {
  eit-uks-alz-ss-mgmt-nsg-01 = {
    eit-alz-ss-mgmt-snet-01 = true
  }
  eit-uks-alz-ss-ca-nsg-01 = {
    eit-alz-ss-ca-snet-01 = true
  }
  eit-uks-alz-ss-adds-nsg-01 = {
    eit-alz-ss-adds-snet-01 = true
  }
}
