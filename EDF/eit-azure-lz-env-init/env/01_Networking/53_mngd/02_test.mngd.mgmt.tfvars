environment = "Test"

######### MngdHS key vault ##############################
mngdhsKvName   = "avmgentsthsmngdsub01kv"
mngdhsKvRgName = ".security"

rgs = {
  gen-uks-tst-hs-managed-vnet-rg-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "Test"
    }
  }
}

###################################### Looping through VNets #####################################
vnets = {
  gen-uks-tst-hs-managed-vnet-01 = {
    enable        = true
    rg            = "gen-uks-tst-hs-managed-vnet-rg-01"
    addressSpace  = "mngdhs-tst-vnet-address-range"
    dnsServerList = "hs-tst-dns-ips"
    subnets = {
      gen-uks-tst-hs-comsy-snet-01 = {
        enable                    = true
        address                   = "mngdhs-tst-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
        # service_endpoints    = ["Microsoft.Sql"] // need to comment this line
      }
      gen-uks-tst-hs-apex-snet-01 = { #created subnet for apex tst
        enable                    = true
        address                   = "apexhs-tst-subnet-address-range"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
      gen-uks-tst-hs-pep-snet-01 = {
        enable                    = true
        address                   = "GEN-MANAGED-TST-PEP-SNET-SECRET"
        enablePrivateLinkEndPoint = true
        enablePrivateLinkService  = true
      }
    }
  }
}

######################## Vnet Peering ##############################

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-gen-uks-tst-hs-managed-vnet-01"
    peer2name = "gen-uks-tst-hs-managed-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"       //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"       //hub network
    vnet2rg   = "gen-uks-tst-hs-managed-vnet-rg-01" //spoke network resource group
    vnet2name = "gen-uks-tst-hs-managed-vnet-01"    //spoke network
  },
  peer-hub-spoke-01 = {
    enable    = false //dummy
    peer1name = "uks-tst-hs-managed-vnet-01-eit-uks-alz-transit-vnet-01"
    peer2name = "gen-uks-prd-hs-mdw-vnet-prd-01-eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"    //hub network resource group
    vnet1name = "eit-uks-alz-transit-vnet-01"    //hub network
    vnet2rg   = "data-uks-prd-vnet-prd-rg-01"    //spoke network resource group
    vnet2name = "gen-uks-prd-hs-mdw-vnet-prd-01" //spoke network
  }
}

tenantId            = "tenantId"            //key vault secret name as value
hubSubscriptionId   = "hubSubscriptionId"   //key vault secret name as value "transitSubscriptionId"
spokeSubscriptionId = "spokeSubscriptionId" //key vault secret name as value "subscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

########################### UDRs,Routes ###############################
UDR = {
  gen-uks-tst-hs-comsy-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-comsy-snet-01-d_On-Prem-Internet", "s_gen-uks-tst-hs-comsy-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-managed-vnet-01"
    RGName                = "gen-uks-tst-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "mngd-tst-udr-prefixes"
    kv_secret_nexthopIP   = "mngd-tst-udr-nexthop"
  }
  gen-uks-tst-hs-apex-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-apex-snet-01-d_On-Prem-Internet", "s_gen-uks-tst-hs-apex-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-managed-vnet-01"
    RGName                = "gen-uks-tst-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "mngd-tst-udr-prefixes" #using eam as the networking locals file references eam
    kv_secret_nexthopIP   = "eam-udr-nexthop"       #can be resused as virtual appliance ip should be mostly same
  }
  gen-uks-tst-hs-pep-udr-01 = {
    enable                = true
    RouteNames            = ["s_gen-uks-tst-hs-pep-snet-01-d_On-Prem_Internet", "s_gen-uks-tst-hs-pep-snet-01-d_NTP_Internet"]
    NextHopTypes          = ["VirtualAppliance", "VirtualAppliance"]
    VNetName              = "gen-uks-tst-hs-managed-vnet-01"
    RGName                = "gen-uks-tst-hs-managed-vnet-rg-01"
    kv_secret_udrprefixes = "mngd-tst-udr-prefixes" #using eam as the networking locals file references eam
    kv_secret_nexthopIP   = "eam-udr-nexthop"       #can be resused as virtual appliance ip should be mostly same
  }
}

##################### UDR association with Subnets #######################

UDR_Subnet_Mapping = {
  gen-uks-tst-hs-comsy-udr-01 = ["gen-uks-tst-hs-comsy-snet-01"]
  gen-uks-tst-hs-apex-udr-01  = ["gen-uks-tst-hs-apex-snet-01"]
  gen-uks-tst-hs-pep-udr-01   = ["gen-uks-tst-hs-pep-snet-01"]
}

################ NSG #########################
nsg = {
  gen-uks-tst-hs-comsy-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-hs-managed-vnet-rg-01"

  }
  gen-uks-tst-hs-apex-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-hs-managed-vnet-rg-01"
  }
  gen-uks-tst-hs-pep-nsg-01 = {
    enable   = true
    location = "UK South"
    rg       = "gen-uks-tst-hs-managed-vnet-rg-01"
  }
}

nsgrules = {
  gen-uks-tst-hs-comsy-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-HSADASG-COMSYDB"
      description                                = "AIA-HSADASG-COMSYDB"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hs-mngd-adds-src-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "450"
      name                                       = "AIT-WACASG-COMSYDB"
      description                                = "AIT-WACASG-COMSYDB"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "650"
    #   name                       = "AIT-OnPrem-COMSYDB"
    #   description                = "AIT-OnPrem-COMSYDB"
    #   protocol                   = "tcp"
    #   destination_port_range     = "1433"
    #   source_port_range          = "*"
    #   source_address_prefix      = "On Prem TBC"
    #   source_address_prefixes    = ""
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "mngdhs-tst-subnet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefix","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-COMSY"
      description                                = "AIT-ADO-COMSY"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-HSMID-COMSY"
      description                                = "AIA-SECGOV-HSMID-COMSY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-HSTENABLE-COMSY"
      description                                = "AIA-SECGOV-HSTENABLE-COMSY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-tenable-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-HSPENTEST-COMSY"
      description                                = "AIA-SECGOV-HSPENTEST-COMSY"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-pentest-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "4000"
      name                                       = "Deny_VNET-VNET"
      description                                = "Deny_VNET-VNET"
      protocol                                   = "tcp"
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
      direction                                  = "Outbound"
      priority                                   = "400"
      name                                       = "AOA-COMSYDB-ADDS"
      description                                = "AOA-COMSYDB-ADDS"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "hs-mngd-adds-src-address-range-01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "450"
      name                                       = "AOT-COMSYDB-LOGA"
      description                                = "AOT-COMSYDB-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
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
      priority                                   = "3000"
      name                                       = "AOT-COMSYDB-AzureAgent"
      description                                = "AOT-COMSYDB-AzureAgent"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "168.63.129.16/32" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3050"
      name                                       = "AOT-COMSYDB-AzureCloud"
      description                                = "AOT-COMSYDB-AzureCloud"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "AzureCloud" //public address
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "2300"
      name                                       = "AOT-COMSYDB-AzureStorage"
      description                                = "AOT-COMSYDB-AzureStorage"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
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
      name                                       = "Deny-VNET-VNET"
      description                                = "Deny-VNET-VNET"
      protocol                                   = "tcp"
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
      priority                                   = "500"
      name                                       = "AIT-AFS-COMSYDB"
      description                                = "AIT-AFS-COMSYDB"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-afs-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      priority                                   = "500"
      name                                       = "AOT-COMSYDB-WSUS"
      description                                = "AOT-COMSYDB-WSUS"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-wsus-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "550"
      name                                       = "AOT-COMSYDB-TENABLEAGENT"
      description                                = "AOT-COMSYDB-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-tenableagent-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "600"
      name                                       = "AOT-COMSY-LINUXUPDATES"
      description                                = "AOT-COMSY-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-COMSY-NTP"
      description                                = "AOT-COMSY-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngd-hs-linux-ntp-service"
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
      name                                       = "AOT-COMSY-KMS"
      description                                = "AOT-COMSY-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // Azure Public IP
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET"
      description                                = "DOA-VNET_INTERNET"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
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
      priority                                   = "100"
      name                                       = "AOA-COMSY-PEP"
      description                                = "AOA-COMSY-PEP"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-MANAGED-TST-COMSY-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MANAGED-TST-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "430"
      name                                       = "AOT-COMSY-ICA"
      description                                = "AOT-COMSY-ICA"
      protocol                                   = "TCP"
      destination_port_range                     = "0-65535"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-tst-subnet-address-range"
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
      priority                                   = "700"
      name                                       = "AOA-HSCOMSY-PEP"
      description                                = "AOA-HSCOMSY-PEP"
      protocol                                   = "TCP"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-TST-HS-COMSY-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-tst-hs-apex-nsg-01 = [
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
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
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
      description                                = "AIT-WAC-APEXMGR"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,5985,22"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-wac-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "550"
      name                                       = "Azure MDW"
      description                                = "Azure MDW"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-mdw-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "600"
      name                                       = "Asset Suite 9"
      description                                = "Asset Suite 9"
      protocol                                   = "tcp"
      destination_port_range                     = "443,80,445"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-ast-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    # {
    #   direction                  = "Inbound"
    #   priority                   = "650"
    #   name                       = "ICC (Integrated Competency Centre)"
    #   description                = "ICC (Integrated Competency Centre)"
    #   protocol                   = "tcp"
    #   destination_port_range     = "443,80,445"
    #   source_port_range          = "*"
    #   source_address_prefix      = ""
    #   source_address_prefixes    = "apex-hs-ast-01-address-range"
    #   destination_address_prefixes = ""
    #   destination_address_prefix = "apexhs-tst-subnet-address-range"
    #   source_application_security_group_ids      = ""
    #   destination_application_security_group_ids = ""
    #   access                     = "Allow"
    #   fetch_from_kv              = ["source_address_prefixes","destination_address_prefix"]
    #   fetch_from_asg             = []
    # },
    {
      direction                                  = "Inbound"
      priority                                   = "650"
      name                                       = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      description                                = "AIA-HSMID-SERVERS-HSMID-SUBNET"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "hssecgov-prd-address-ranges"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "700"
      name                                       = "JUMP_Server"
      description                                = "JUMP_Server"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,22,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-hs-jmp-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "800"
      name                                       = "AIA-SECGOV-MID-APEXMGR"
      description                                = "AIA-SECGOV-MID-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-mid-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "850"
      name                                       = "AIA-SECGOV-TENABLE-APEXMGR"
      description                                = "AIA-SECGOV-TENABLE-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-tenable-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "900"
      name                                       = "AIA-SECGOV-PENTEST-APEXMGR"
      description                                = "AIA-SECGOV-PENTEST-APEXMGR"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-secgov-pentst-01-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "750"
      name                                       = "AIT-ADO-APEX"
      description                                = "AIT-ADO-APEX"
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-ado-snet-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "810"
      name                                       = "AIA-SECGOV-HSMID-APEX"
      description                                = "AIA-SECGOV-HSMID-APEX"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-prd-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "860"
      name                                       = "AIA-SECGOV-HSTENABLE-APEX"
      description                                = "AIA-SECGOV-HSTENABLE-APEX"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-tenable-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "910"
      name                                       = "AIA-SECGOV-HSPENTEST-APEX"
      description                                = "AIA-SECGOV-HSPENTEST-APEX"
      protocol                                   = "*"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "hssecgov-ado-pentest-01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
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
      priority                                   = "541"
      name                                       = "AIA-ICMP-APEX-TST-DB-WEB"
      description                                = "AIA-ICMP-APEX-TST-DB-WEB"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-tst-address-ranges"
      destination_address_prefixes               = "mngdhs-apex-tst-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1001"
      name                                       = "AIA-PPCOREDEV-APEX-TST-WEB"
      description                                = "AIA-PPCOREDEV-APEX-TST-WEB"
      protocol                                   = "*"
      destination_port_range                     = "22,443,8080,8443"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-tst-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1011"
      name                                       = "AIA-PPCOREDEV-APEX-TST-DB"
      description                                = "AIA-PPCOREDEV-APEX-TST-DB"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1522"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-ppcoredev-address-range-01"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-tst-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1051"
      name                                       = "AIA-HS-WAC-APEX-TST" //AIT-HS-WAC-APEX-TST
      description                                = "AIA-HS-WAC-APEX-TST"
      protocol                                   = "tcp"
      destination_port_range                     = "22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngd-hs-wac-apex-address-range-01"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngdhs-apex-tst-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "3011"
      name                                       = "AIA-APEX-TST-DB-WEB"
      description                                = "AIA-APEX-TST-DB-WEB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-tst-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-tst-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "3021"
      name                                       = "AIA-APEX-TST-WEB-DB"
      description                                = "AIA-APEX-TST-WEB-DB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-tst-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-tst-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      name                                       = "AOT-APEXMGR-Devices"
      description                                = "AOT-APEXMGR-Devices"
      protocol                                   = "tcp"
      destination_port_range                     = "8530"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      direction                                  = "Outbound" //updated
      priority                                   = "640"
      name                                       = "Azure(Integrated Competency Centre)"
      description                                = "Azure(Integrated Competency Centre)"
      protocol                                   = "tcp"
      destination_port_range                     = "8444,8443,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-icc-01-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      name                                       = "AOT-APEXMGR-KMS"
      description                                = "AOT-APEXMGR-KMS"
      protocol                                   = "tcp"
      destination_port_range                     = "1688"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "azure-KMS-address"
      destination_address_prefix                 = "" // Azure Public IP
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
      protocol                                   = "tcp"
      destination_port_range                     = "443,445"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      name                                       = "Deny-VNET_VNET"
      description                                = "Deny-VNET_VNET"
      protocol                                   = "tcp"
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
      direction                                  = "Outbound"
      priority                                   = "541"
      name                                       = "AOT-ICMP-APEX-TST-DB-WEB"
      description                                = "AOT-ICMP-APEX-TST-DB-WEB"
      protocol                                   = "ICMP"
      destination_port_range                     = "8080"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "mngdhs-apex-tst-address-ranges"
      destination_address_prefixes               = "mngdhs-apex-tst-address-ranges"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3011"
      name                                       = "AOT-APEX-TST-DB-WEB"
      description                                = "AOT-APEX-TST-DB-WEB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-tst-vm02-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-tst-vm01-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3021"
      name                                       = "AOT-APEX-TST-WEB-DB"
      description                                = "AOT-APEX-TST-WEB-DB"
      protocol                                   = "*"
      destination_port_range                     = "1521,22"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-tst-vm01-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "mngdhs-apex-tst-vm02-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "3031"
      name                                       = "AOT-APEX-TST-WEB-PPCOREDEV"
      description                                = "AOT-APEX-TST-WEB-PPCOREDEV"
      protocol                                   = "*"
      destination_port_range                     = "22,443,8080,8443"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-tst-vm01-address-range"
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
      priority                                   = "3041"
      name                                       = "AOT-APEX-TST-DB-PPCOREDEV"
      description                                = "AOT-APEX-TST-DB-PPCOREDEV"
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1522"
      source_port_range                          = "*"
      source_address_prefix                      = "mngdhs-apex-tst-vm02-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "500"
      name                                       = "AIT-AFS-APEX"
      description                                = "AIT-AFS-APEX"
      protocol                                   = "tcp"
      destination_port_range                     = "445"
      source_port_range                          = "*"
      source_address_prefix                      = "eit-alz-hs-mgmt-afs-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      priority                                   = "550"
      name                                       = "AOT-APEXMGR-TENABLEAGENT"
      description                                = "AOT-APEXMGR-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "eit-alz-hs-mgmt-tenableagent-address-range" //need to update
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
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      direction                                  = "Outbound" // added
      priority                                   = "650"
      name                                       = "AOT-APEX-NTP"
      description                                = "AOT-APEX-NTP"
      protocol                                   = "udp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "mngd-hs-linux-ntp-service"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "4096"
      name                                       = "DOA-VNET_INTERNET-OB"
      description                                = "DOA-VNET_INTERNET-OB"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
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
      priority                                   = "660"
      name                                       = "AOT-BPO-TST-EAM"
      description                                = "AOT-BPO-TST-EAM"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "EAM-Next-Axiom-ip-address"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "670"
      name                                       = "AOT-BPO-TST-BWD"
      description                                = "AOT-BPO-TST-BWD"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = "BWD-Next-Axiom-address-range"
      destination_address_prefix                 = ""
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefixes"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "680"
      name                                       = "AOT-BPO-TST-BWD-TST-DW"
      description                                = "AOT-BPO-TST-BWD-TST-DW"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BWD-TST-DataWarehouse-ip-address"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "690"
      name                                       = "AOT-BPO-TST-BWD-PRD-DW"
      description                                = "AOT-BPO-TST-BWD-PRD-DW"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BWD-PRD-DataWarehouse-ip-address"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "700"
      name                                       = "AOT-BPO-TST-MDW"
      description                                = "AOT-BPO-TST-MDW"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "MDW-TST-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "710"
      name                                       = "AOT-BPO-TST-BWD-SMTP"
      description                                = "AOT-BPO-TST-BWD-SMTP"
      protocol                                   = "tcp"
      destination_port_range                     = "25"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "BWD-SMTP-ip-address"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
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
      source_address_prefix                      = "GEN-MANAGED-TST-APEX-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-MANAGED-TST-PEP-SNET-SECRET"
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
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "102"
      name                                       = "AOT-TSTBPO-LOGA"
      description                                = "AOT-TSTBPO-LOGA"
      protocol                                   = "tcp"
      destination_port_range                     = "443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "103"
      name                                       = "AOT-TSTBPO-TENABLEAGENT"
      description                                = "AOT-TSTBPO-TENABLEAGENT"
      protocol                                   = "tcp"
      destination_port_range                     = "8834"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "104"
      name                                       = "AOT-TSTBPO-LINUXUPDATES"
      description                                = "AOT-TSTBPO-LINUXUPDATES"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "105"
      name                                       = "AOT-TSTBPO-NTP"
      description                                = "AOT-TSTBPO-NTP"
      protocol                                   = "tcp"
      destination_port_range                     = "123"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "106"
      name                                       = "AOT-TSTBPO-DEVBPO"
      description                                = "AOT-TSTBPO-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-dev-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "107"
      name                                       = "AOT-TSTBPO-UATBPO"
      description                                = "AOT-TSTBPO-UATBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "108"
      name                                       = "AOT-TSTBPO-PRDBPO"
      description                                = "AOT-TSTBPO-PRDBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "109"
      name                                       = "AOT-TSTBPO-NGOTST01"
      description                                = "AOT-TSTBPO-NGOTST01"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "110"
      name                                       = "AOT-TSTBPO-ngoliv01"
      description                                = "AOT-TSTBPO-ngoliv01"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "111"
      name                                       = "AOT-TSTBPO-NXATST01"
      description                                = "AOT-TSTBPO-NXATST01"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-bwd-nxatst01"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "112"
      name                                       = "AOT-TSTBPO-NXAUAT01"
      description                                = "AOT-TSTBPO-NXAUAT01"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "113"
      name                                       = "AOT-TSTBPO-NXAPRD01"
      description                                = "AOT-TSTBPO-NXAPRD01"
      protocol                                   = "tcp"
      destination_port_range                     = "80,443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "114"
      name                                       = "AOT-TSTBPO-MDW_TST_ANL_SNET"
      description                                = "AOT-TSTBPO-MDW_TST_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-mdw-tst-analyse"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "115"
      name                                       = "AOT-TSTBPO-MDW_UAT_ANL_SNET"
      description                                = "AOT-TSTBPO-MDW_UAT_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "116"
      name                                       = "AOT-TSTBPO-MDW_PRD_ANL_SNET"
      description                                = "AOT-TSTBPO-MDW_PRD_ANL_SNET"
      protocol                                   = "tcp"
      destination_port_range                     = "1433"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "117"
      name                                       = "AOT-TSTBPO-Azure_TST_OEM"
      description                                = "AOT-TSTBPO-Azure_TST_OEM"
      protocol                                   = "tcp"
      destination_port_range                     = "1159,4889-4898,4899-4908"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-tst"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "118"
      name                                       = "ICMP-BiDirectional-TSTBPO-Azure_TST_OEM"
      description                                = "ICMP-BiDirectional-TSTBPO-Azure_TST_OEM"
      protocol                                   = "ICMP"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-oem-tst"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apex-hs-dev-devbpo-oem-tst"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "119"
      name                                       = "AIT-TSTBPO-EAM_UAT_Next Axiom"
      description                                = "AIT-TSTBPO-EAM_UAT_Next Axiom"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      priority                                   = "120"
      name                                       = "AIT-TSTBPO-EAM_PRD_NEXTAXIOM"
      description                                = "AIT-TSTBPO-EAM_PRD_NEXTAXIOM"
      protocol                                   = "tcp"
      destination_port_range                     = "8444"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
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
      direction                                  = "Inbound"
      priority                                   = "101"
      name                                       = "AIA-SECGOV-MID-TSTBPO"
      description                                = "AIA-SECGOV-MID-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "apex-hs-dev-bpo-address-range"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "102"
      name                                       = "AIA-SECGOV-TENABLE-TSTBPO"
      description                                = "AIA-SECGOV-TENABLE-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bpo-tenable"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "103"
      name                                       = "AIA-SECGOV-PENTEST-TSTBPO"
      description                                = "AIA-SECGOV-PENTEST-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "*"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-bpo-pentest"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "104"
      name                                       = "AIT-MDW_DEV_ACQ_SNET-TSTBPO"
      description                                = "AIT-MDW_DEV_ACQ_SNET-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-dev-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "105"
      name                                       = "AIT-MDW_TST_ACQ_SNET-TSTBPO"
      description                                = "AIT-MDW_TST_ACQ_SNET-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-tst-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "106"
      name                                       = "AIT-MDW_UAT_ACQ_SNET-TSTBPO"
      description                                = "AIT-MDW_UAT_ACQ_SNET-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-uat-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "107"
      name                                       = "AIT-MDW_PRD_ACQ_SNET-TSTBPO"
      description                                = "AIT-MDW_PRD_ACQ_SNET-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-prd-acq-snet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "108"
      name                                       = "AIT-Azure_TST_OEM-TSTBPO"
      description                                = "AIT-Azure_TST_OEM-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "22,1521-1522,3872"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-devbpo-oem-tst"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "109"
      name                                       = "AIT-DEVBPO-TSTBPO"
      description                                = "AIT-DEVBPO-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-dev-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "110"
      name                                       = "AIT-UATBPO-TSTBPO"
      description                                = "AIT-UATBPO-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "apex-hs-dev-uat-bpo-subnet"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
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
      source_address_prefix                      = "GEN-UKS-TST-HS-APEX-SNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "111"
      name                                       = "AIT-DevWorkstations-TSTBPO"
      description                                = "AIT-DevWorkstations-TSTBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "3389,22,445,80,443,8080,8443,1521-1526"
      source_port_range                          = "*"
      source_address_prefix                      = "AIT-DevWorkstations-CI-jump"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "112"
      name                                       = "AIT-PRD_CI_APP_Gateway-DEVBPO"
      description                                = "AIT-PRD_CI_APP_Gateway-DEVBPO"
      protocol                                   = "tcp"
      destination_port_range                     = "8443"
      source_port_range                          = "*"
      source_address_prefix                      = "PRD-CI-App-Gateway-DEVBPO"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "1002"
      name                                       = "AIA-OEM-APEX"
      description                                = "AIA-OEM-APEX  "
      protocol                                   = "*"
      destination_port_range                     = "22,1521-1524,2484-2488,3872-3873"
      source_port_range                          = "*"
      source_address_prefix                      = "OEM-APEX"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1000"
      name                                       = "AOA-APEX-OEM"
      description                                = "AOA-APEX-OEM"
      protocol                                   = "*"
      destination_port_range                     = "4903"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "OEM-APEX"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Outbound"
      priority                                   = "1060"
      name                                       = "APEX System Test to NxA System Test"
      description                                = "APEX System Test to NxA System Test"
      protocol                                   = "tcp"
      destination_port_range                     = "8443"
      source_port_range                          = "*"
      source_address_prefix                      = "apexhs-tst-subnet-address-range"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "gen-uks-tst-hs-eam-shared-snet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefix", "destination_address_prefix"]
      fetch_from_asg                             = []
    },
    {
      direction                                  = "Inbound"
      priority                                   = "560"
      name                                       = "Dynatrace Managed System Test to Apex Test"
      description                                = "Dynatrace Managed System Test to Apex Test"
      protocol                                   = "*"
      destination_port_range                     = "443,9999"
      source_port_range                          = "*"
      source_address_prefix                      = ""
      source_address_prefixes                    = "dynatrace-test-managed-servers-address"
      destination_address_prefixes               = ""
      destination_address_prefix                 = "apexhs-tst-subnet-address-range"
      source_application_security_group_ids      = ""
      destination_application_security_group_ids = ""
      access                                     = "Allow"
      fetch_from_kv                              = ["source_address_prefixes", "destination_address_prefix"]
      fetch_from_asg                             = []
    }
  ]
  gen-uks-tst-hs-pep-nsg-01 = [
    {
      direction                                  = "Inbound"
      priority                                   = "400"
      name                                       = "AIA-VNET-PEP"
      description                                = "AIA-VNET-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "GEN-UKS-TST-HS-MNGD-VNET-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
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
      destination_address_prefix                 = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
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
      destination_address_prefix                 = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
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
      destination_address_prefix                 = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-MANAGED-TST-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-MANAGED-TST-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-MANAGED-TST-PEP-SNET-SECRET"
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
      name                                       = "AIA-ADO-PEP"
      description                                = "AIA-ADO-PEP"
      destination_port_range                     = "443,445"
      protocol                                   = "tcp"
      source_port_range                          = "*"
      source_address_prefix                      = "ADO-SECRET"
      source_address_prefixes                    = ""
      destination_address_prefixes               = ""
      destination_address_prefix                 = "GEN-UKS-TST-HS-PEP-SNET-SECRET"
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
      source_address_prefix                      = "GEN-MANAGED-TST-PEP-SNET-SECRET"
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
  gen-uks-tst-hs-comsy-nsg-01 = {
    gen-uks-tst-hs-comsy-snet-01 = true
  }
  gen-uks-tst-hs-apex-nsg-01 = {
    gen-uks-tst-hs-apex-snet-01 = true
  }
  gen-uks-tst-hs-pep-nsg-01 = {
    gen-uks-tst-hs-pep-snet-01 = true
  }
}

########### NSG Diag Settings ############
category1enabled     = true
retention_policy     = true
retention_policydays = 90
category1            = "NetworkSecurityGroupEvent"
category2            = "NetworkSecurityGroupRuleCounter"
comsy_nsg_name       = "gen-uks-tst-hs-comsy-nsg-01"
apex_nsg_name        = "gen-uks-tst-hs-apex-nsg-01"
pep_nsg_name         = "gen-uks-tst-hs-pep-nsg-01"
nsg_rg_name          = "gen-uks-tst-hs-managed-vnet-rg-01"

########### VNET Diag Settings ############
category_enabled          = true
category_disabled         = false
retention_policy_enabled  = true
retention_policy_disabled = false
category3                 = "VMProtectionAlerts"
category4                 = "AllMetrics"
diag_vnet_name            = "gen-uks-tst-hs-managed-vnet-01"
diag_vnet_rg              = "gen-uks-tst-hs-managed-vnet-rg-01"
