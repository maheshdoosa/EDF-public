environment = "High Secured Managed"

# gencoreuat np hs key vault
apexKvName = "avmgentsthsmngdsub01kv"
apexRgName = ".security"

###########################################################################

rgs = {
  gen-uks-uat-hs-managed-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "High Secured Managed"
    }
  }
}

vnets = {
  gen-uks-uat-hs-managed-vnet-01 = {
    enable        = true
    rg            = "gen-uks-uat-hs-managed-vnet-rg-01"
    addressSpace  = "gen-core-uat-hs-vnet-address-range" //key vault secret name as value
    dnsServerList = "hs-tst-dns-ips"                     //key vault secret name as value
    subnets = {
      gen-uks-uat-hs-apex-snet-01 = {
        enable                    = true
        address                   = "gen-uks-uat-hs-adds-snet-address-range" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-uat-hs-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-MANAGED-UAT-PEP-SNET-SECRET" //key vault secret name as value
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}
################# Vnet Peering ################
vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-uat-hs-managed-vnet-01"
    peer2name = "gen-uks-uat-hs-managed-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"       //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"       //hub network
    vnet2rg   = "gen-uks-uat-hs-managed-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-uat-hs-managed-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-prd-hs-mdw-vnet-prd-01"
    peer2name = "gen-uks-prd-hs-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-hs-mdw-vnet-prd-01" //spoke network
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

########### UDR #######################
UDR = {
  gen-uks-uat-hs-apex-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-uat-hs-apex-snet-01-d_On-Prem-Internet", "s_gen-uks-uat-hs-apex-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-uat-hs-managed-vnet-01"
    RGName                = "gen-uks-uat-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "gencore-uat-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gencore-uat-udr-nexthop"  //key vault secret name as value
  }
  gen-uks-uat-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-uat-hs-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-uat-hs-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-uat-hs-managed-vnet-01"
    RGName                = "gen-uks-uat-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "gencore-uat-udr-prefixes" //key vault secret name as value
    kv_secret_nexthopIP   = "gencore-uat-udr-nexthop"  //key vault secret name as value
  }
}

##################### UDR association with Subnets #######################
UDR_Subnet_Mapping = {
  gen-uks-uat-hs-apex-udr-01 = ["gen-uks-uat-hs-apex-snet-01"]
  gen-uks-uat-hs-pep-udr-01  = ["gen-uks-uat-hs-pep-snet-01"]
}

############ NSG ########################

nsg = {
  gen-uks-uat-hs-apex-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-uat-hs-managed-vnet-rg-01"
  },
  gen-uks-uat-hs-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-uat-hs-managed-vnet-rg-01"
  }
}

nsgrules = {

  gen-uks-uat-hs-apex-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-ADDS-APEXMGR"
      description                                = "AIA-ADDS-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-adds-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WAC-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985,22"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-WAC-APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS--APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-afs-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-AFS--APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "540"
      name                                       = "AIA-ICMP-APEX-UAT-DB-WEB"
      description                                = "AIA-ICMP-APEX-UAT-DB-WEB"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-uat-address-ranges"
      destination_address_prefixes               = "mngdhs-apex-uat-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "AIT-MDW-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-mdw-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-MDW-APEXMGR"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "AIT-EAM-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-ast-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-EAM-APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIT-JUMPSVR-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "3389, 22"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-jump-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-JUMPSVR-APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-ado-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIT-ADO-APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-secgov-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-MID-APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-tanb-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-TENABLE-APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-pent-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      description                                = "AIA-SECGOV-PENTEST-APEXMGR"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "1000"
      name                                       = "AIA-PPCOREDEV-APEX-UAT-WEB"
      description                                = "AIA-PPCOREDEV-APEX-UAT-WEB"
      protocol                                   = "*"
      destination_port_range                     = "22,443,8080,8443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-uat-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "1050"
      name                                       = "AIT-HS-WAC-APEX-UAT"
      description                                = "AIT-HS-WAC-APEX-UAT"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngd-hs-wac-apex-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngdhs-apex-uat-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "1010"
      name                                       = "AIA-PPCOREDEV-APEX-UAT-DB"
      description                                = "AIA-PPCOREDEV-APEX-UAT-DB"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1522"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-uat-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "3015"
      name                                       = "AIA-APEX-UAT-DB-WEB"
      description                                = "AIA-APEX-UAT-DB-WEB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-uat-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-uat-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound" //updated
      priority                                   = "3020"
      name                                       = "AIA-APEX-UAT-WEB-DB"
      description                                = "AIA-APEX-UAT-WEB-DB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-uat-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-uat-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
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
      fetch_from_kv                              = []
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4096"
      name                                       = "DIA-INTERNET-VNET"
      description                                = "DIA-INTERNET-VNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
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
      priority                                   = "400"
      name                                       = "AOA-APEXMGR-ADDS"
      description                                = "AOA-APEXMGR-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-adds-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-APEXMGR-LOGA"
      description                                = "AOT-APEXMGR-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ALZ-HS-LOGA-KEY-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "500"
      name                                       = "AOU-APEXMGR-WSUS"
      description                                = "AOT-APEXMGR-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-devices-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "540"
      name                                       = "AOT-ICMP-APEX-UAT-DB-WEB"
      description                                = "AOT-ICMP-APEX-UAT-DB-WEB"
      protocol                                   = "ICMP"
      destination_port_range                     = "8080"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-uat-address-ranges"
      destination_address_prefixes               = "mngdhs-apex-uat-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-APEXMGR-TENABLEAGENT"
      description                                = "AOT-APEXMGR-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-tenable-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-APEXMGR-LINUXUPDATES"
      description                                = "AOT-APEXMGR-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "660"
      name                                       = "AOT-APEXMGR-AFS"
      description                                = "AOT-APEXMGR-AFS"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-afs-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "700"
      name                                       = "AOT-APEXMGR-EAM"
      description                                = "AOT-APEXMGR-EAM"
      protocol                                   = "tcp"
      destination_port_range                     = "8444, 8443, 443"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-eam-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3000"
      name                                       = "AOT-APEXMGR-AzureAgent"
      description                                = "AOT-APEXMGR-AzureAgent"
      destination_port_range                     = "443"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-APEXMGR-AzureCloud"
      description                                = "AOT-APEXMGR-AzureCloud"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
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
      priority                                   = "3010"
      name                                       = "AOT-APEX-UAT-DB-WEB"
      description                                = "AOT-APEX-UAT-DB-WEB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-uat-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-uat-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3020"
      name                                       = "AOT-APEX-UAT-WEB-DB"
      description                                = "AOT-APEX-UAT-WEB-DB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-uat-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-uat-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3030"
      name                                       = "AOT-APEX-UAT-WEB-PPCOREDEV"
      description                                = "AOT-APEX-UAT-WEB-PPCOREDEV"
      protocol                                   = "*"
      destination_port_range                     = "22,443,8080,8443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-uat-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3040"
      name                                       = "AOT-APEX-UAT-DB-PPCOREDEV"
      description                                = "AOT-APEX-UAT-DB-PPCOREDEV"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1522"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-uat-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3100"
      name                                       = "AOT-APEXMGR-KMS"
      description                                = "AOT-APEXMGR-KMS"
      destination_port_range                     = "1688"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // hardcoded as this is a Azure public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3300"
      name                                       = "AOT-APEXMGR-AzureStorage"
      description                                = "AOT-APEXMGR-AzureStorage"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
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
      priority                                   = "4050"
      name                                       = "DOA-VNET_VNET"
      description                                = "DOA-VNET_VNET"
      destination_port_range                     = "*"
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
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
      destination_port_range                     = "*"
      protocol                                   = "tcp"
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
    },
    {
      direction                                  = "Outbound"
      priority                                   = "650"
      name                                       = "AOT-APEXMGR-NTP"
      description                                = "AOT-APEXMGR-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "Apex-uat-linux-ntp-service"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "100"
      name                                       = "AOA-APEX-PEP"
      description                                = "AOA-APEX-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MANAGED-UAT-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-APEX-ICA"
      description                                = "AOT-APEX-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hs-ica-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "101"
      name                                       = "AOT-UATBPO-EAM UAT Next Axiom"
      description                                = "AOT-UATBPO-EAM UAT Next Axiom"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-axiom-eam-uat-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "102"
      name                                       = "AOT-UATBPO-EAM PRD Next Axiom"
      description                                = "AOT-UATBPO-EAM PRD Next Axiom"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-axiom-eam-prd-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "103"
      name                                       = "AOT-UATBPO-BWD Next Axiom"
      description                                = "AOT-UATBPO-BWD Next Axiom"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "apex-hs-bwd-axiom-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "104"
      name                                       = "AOT-UATBWD-DataWarehouse"
      description                                = "AOT-UATBWD-DataWarehouse"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-bwd-dataware-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "105"
      name                                       = "AOT-UATBPO-BWD PRD DataWarehouse"
      description                                = "AOT-UATBPO-BWD PRD DataWarehouse"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-bwd-prd-dataware-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "106"
      name                                       = "AOT-UATBPD-MDW UAT ANL SNET"
      description                                = "AOT-UATBPD-MDW UAT ANL SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-mdw-uat-analyse"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "107"
      name                                       = "AOT-UATBPD-MDW PRD ANL SNET"
      description                                = "AOT-UATBPD-MDW PRD ANL SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-mdw-prd-analyse"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "108"
      name                                       = "AOT-UATBWD-BWD SMTP"
      description                                = "AOT-UATBWD-BWD SMTP"
      protocol                                   = "tcp"
      destination_port_range                     = "25"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-bwd-smtp-01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "109"
      name                                       = "AOT-UATBPO-LOGA"
      description                                = "AOT-UATBPO-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-sec-loga"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "110"
      name                                       = "AOT-UATBPO-TENABLEAGENT"
      description                                = "AOT-UATBPO-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-onprem-tenable"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "111"
      name                                       = "AOT-UATBPO-LINUXUPDATES"
      description                                = "AOT-UATBPO-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "Internet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "112"
      name                                       = "AOT-UATBPO-NTP"
      description                                = "AOT-UATBPO-NTP"
      protocol                                   = "tcp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-azure-ntp"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "113"
      name                                       = "AOT-UATBPO-Azure PRDBPO"
      description                                = "AOT-UATBPO-Azure PRDBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-prd-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "114"
      name                                       = "AOT-UATBPO-NGOTST01"
      description                                = "AOT-UATBPO-NGOTST01"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-ngotst01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "115"
      name                                       = "AOT-UATBPO-ngoliv01"
      description                                = "AOT-UATBPO-ngoliv01"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-ngoliv01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "116"
      name                                       = "AOT-UATBPO-NXAUAT01"
      description                                = "AOT-UATBPO-NXAUAT01"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-nxauat01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "117"
      name                                       = "AOT-UATBPO-NXAPRD01"
      description                                = "AOT-UATBPO-NXAPRD01"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-nxaprd01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "118"
      name                                       = "AOT-UATBPO-Azure_PRD_OEM"
      description                                = "AOT-UATBPO-Azure_PRD_OEM"
      protocol                                   = "tcp"
      destination_port_range                     = "1159,4889-4898,4899-4908"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-prd"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    /*{
      direction                                  = "Outbound"
      priority                                   = "119"
      name                                       = "ICMP-BiDirectional-UATBPO-Azure_PRD_OEM"
      description                                = "ICMP-BiDirectional-UATBPO-Azure_PRD_OEM"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-oem-prd"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-prd"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "120"
      name                                       = "AIT-BWDJumpbox-Azure_PRD_OEM"
      description                                = "AIT-BWDJumpbox-Azure_PRD_OEM"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bwd-jump-oem-tst"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-prd"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },*/
    {
      direction                                  = "Inbound"
      priority                                   = "101"
      name                                       = "AIA-SECGOV-MID-UATBPO"
      description                                = "AIA-SECGOV-MID-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-dev-bpo-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "102"
      name                                       = "AIA-SECGOV-TENABLE-UATBPO"
      description                                = "AIA-SECGOV-TENABLE-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bpo-tenable"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "103"
      name                                       = "AIA-SECGOV-PENTEST-UATBPO"
      description                                = "AIA-SECGOV-PENTEST-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bpo-pentest"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "104"
      name                                       = "AIT-MDW_UAT_ACQ_SNET-UATBPO"
      description                                = "AIT-MDW_UAT_ACQ_SNET-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-uat-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "105"
      name                                       = "AIT-MDW_DEV_ACQ_SNET-UATBPO"
      description                                = "AIT-MDW_DEV_ACQ_SNET-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-dev-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "106"
      name                                       = "AIT-MDW_PRD_ACQ_SNET-UATBPO"
      description                                = "AIT-MDW_PRD_ACQ_SNET-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-prd-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "107"
      name                                       = "AIT-Azure_PRD_OEM-UATBPO"
      description                                = "AIT-Azure_PRD_OEM-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "22,1521-1526,3872"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-oem-prd"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "108"
      name                                       = "AIT-ICMP-BiDirectional-UATBPO-Azure_PRD_OEM"
      description                                = "AIT-ICMP-BiDirectional-UATBPO-Azure_PRD_OEM"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-oem-prd"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "121"
      name                                       = "AOT-ICMP-BiDirectional-UATBPO-Azure_PRD_OEM"
      description                                = "AOT-ICMP-BiDirectional-UATBPO-Azure_PRD_OEM"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-prd"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "109"
      name                                       = "AIT-DevWorkstations-UATBPO"
      description                                = "AIT-DevWorkstations-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,22,445,80,443,8080,8443,1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-DevWorkstations-CI-jump"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "110"
      name                                       = "AIT-PRD_CI_APP_Gateway-TSTBPO"
      description                                = "AIT-PRD_CI_APP_Gateway-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "8443"
      source_port_range                          = "*"
      source_address_prefix                      = "PRD-CI-App-Gateway-DEVBPO"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-uat-bpo-subnet"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "111"
      name                                       = "AIT-BWDJumpbox-Azure_PRD_OEM"
      description                                = "AIT-BWDJumpbox-Azure_PRD_OEM"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bwd-jump-oem-tst"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-prd"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1001"
      name                                       = "AIA-OEM-APEX"
      description                                = "AIA-OEM-APEX"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1524,2484-2488,3872-3873"
      source_port_range                          = "*"
      source_address_prefix                      = "APEX-OEM"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-uat-hs-adds-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1001"
      name                                       = "AOA-APEX-OEM"
      description                                = "AOA-APEX-OEM"
      protocol                                   = "*"
      destination_port_range                     = "4903"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "APEX-OEM"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1060"
      name                                       = "APEX User Acceptance to NxA User Acceptance"
      description                                = "APEX User Acceptance to NxA User Acceptance"
      protocol                                   = "tcp"
      destination_port_range                     = "18443"
      source_port_range                          = "*"
      source_address_prefix                      = "gen-uks-uat-hs-adds-snet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-prd-hs-eam-ua-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-uat-hs-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-VNET-PEP"
      description                                = "AIA-VNET-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-UAT-HS-MNGD-VNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-UAT-HS-PEP-SNET-SECRET"
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
      destination_address_prefix                 = "GEN-UKS-UAT-HS-PEP-SNET-SECRET"
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
      destination_address_prefix                 = "GEN-UKS-UAT-HS-PEP-SNET-SECRET"
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
      destination_address_prefix                 = "GEN-UKS-UAT-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-UKS-UAT-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-MANAGED-UAT-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-MANAGED-UAT-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-MANAGED-UAT-PEP-SNET-SECRET"
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
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-PEP-ICA"
      description                                = "AOT-PEP-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MANAGED-UAT-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "hs-ica-subnet-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-EITADO-PEPSNET"
      description                                = "AIT-EITADO-PEPSNET"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "ADO-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-UAT-HS-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "701"
      name                                       = "AOA-APEXHS-PEP"
      description                                = "AOA-APEXHS-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-UAT-HS-APEX-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-UAT-HS-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-PEP-LOGA"
      description                                = "AOT-PEP-LOGA"
      protocol                                   = "TCP"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MANAGED-UAT-PEP-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "ALZ-HS-LOGA-KEY-01"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
}

nsg_subnet_mapping = {
  gen-uks-uat-hs-apex-nsg-01 = {
    gen-uks-uat-hs-apex-snet-01 = true
  }
  gen-uks-uat-hs-pep-nsg-01 = {
    gen-uks-uat-hs-pep-snet-01 = true
  }
}

########### NSG Diag Settings ############
category1enabled     = true
retention_policy     = true
retention_policydays = 90
category1            = "NetworkSecurityGroupEvent"
category2            = "NetworkSecurityGroupRuleCounter"
apex_nsg_name        = "gen-uks-uat-hs-apex-nsg-01"
pep_nsg_name         = "gen-uks-uat-hs-pep-nsg-01"
nsg_rg_name          = "gen-uks-uat-hs-managed-vnet-rg-01"

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
category3                 = "VMProtectionAlerts"
category4                 = "AllMetrics"
diag_vnet_name            = "gen-uks-uat-hs-managed-vnet-01"
diag_vnet_rg              = "gen-uks-uat-hs-managed-vnet-rg-01"
