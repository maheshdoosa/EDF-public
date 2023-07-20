environment = "Live"

#transit resource group
lzTransitNetworkingRgName = "eit-uks-alz-transit-vnet-rg"

#transit networking
lzTransitNetworkingResourceLocation = "uksouth"
lzTransitVnetName                   = "eit-uks-alz-transit-vnet-01"
t1intfwTransitSubnetName            = "eit-alz-t1int-snet-01"
t1extfwTransitSubnetName            = "eit-alz-t1ext-snet-01"
t1mgmtfwTransitSubnetName           = "eit-alz-t1mgmt-snet-01"
t2intfwTransitSubnetName            = "eit-alz-t2int-snet-01"
t2mgmtfwTransitSubnetName           = "eit-alz-t2mgmt-snet-01"
t1HaSyncfwTransitSubnetName         = "eit-alz-t1hasync-snet-01"
t1fwIlbIp                           = "t1fw-ilb-ip"
t2fwIlbIp                           = "t2fw-ilb-ip"

#transit key vault
transitKvName   = "eitlztransitkv"
transitKvRgName = ".security"

#t1fw-internal
t1fwIntRouteTableName        = "eit-uks-alz-t1fw-int-udr-01"
t1fwIntRouteNames            = ["s_eit-uks-t1int-snet-d-eit-uks-t1mgmt-snet", "s_eit-uks-t1int-snet_d-eit-uks-t1ext-snet", "s_eit-uks-t1int-snet_d-eit-uks-alz-vnets"]
t1fwIntRoutesNextHopTypes    = ["None", "None", "VirtualAppliance"]
t1fwIntRouteNextHopIpSecrets = ["", "", "t2fw-ilb-ip"]

#t1fw-external
t1fwExtRouteTableName        = "eit-uks-alz-t1fw-ext-udr-01"
t1fwExtRouteNames            = ["s_eit-uks-t1ext-snet-d_eit-uks-t1mgmt-snet", "s_eit-uks-t1ext-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1ext-snet-d_eit-uks-alz-vnets"]
t1fwExtRoutesNextHopTypes    = ["None", "None", "None"]
t1fwExtRouteNextHopIpSecrets = ["", "", ""]

#t1fw-management
t1fwMgmtRouteTableName     = "eit-uks-alz-t1fw-mgmt-udr-01"
t1fwMgmtRouteNames         = ["s_eit-uks-t1mgmt-snet-d_eit-uks-t1ext-snet", "s_eit-uks-t1mgmt-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1mgmt-snet-d_eit-uks-alz-vnets", "s_eit-uks-t1mgmt-snet-d_eit-FortiManager"]
t1fwMgmtRoutesNextHopTypes = ["None", "None", "None", "VirtualNetworkGateway"]

#t2fw-internal
t2fwIntRouteTableName        = "eit-uks-alz-t2fw-int-udr-01"
t2fwIntRouteNames            = ["s_eit-uks-t2int-snet-d_eit-uks-t2mgmt-snet", "s_eit-uks-t1int-snet-d_Internet"]
t2fwIntRoutesNextHopTypes    = ["None", "VirtualAppliance"]
t2fwIntRouteNextHopIpSecrets = ["", "t1fw-ilb-ip"]

#t2fw-management
t2fwMgmtRouteTableName        = "eit-uks-alz-t2fw-mgmt-udr-01"
t2fwMgmtRouteNames            = ["s_eit-uks-t2mgmt-snet-d_eit-uks-t2int-snet", "s_eit-uks-t2mgmt-snet-d_eit-uks-alz-vnets", "s_eit-uks-t2mgmt-snet-d_Internet", "s_eit-uks-t2mgmt-snet-d_eit-panarama"]
t2fwMgmtRoutesNextHopTypes    = ["None", "None", "VirtualAppliance", "VirtualNetworkGateway"]
t2fwMgmtRouteNextHopIpSecrets = ["", "", "t1fw-ilb-ip", ""]

#t1fw-hasync
t1fwHaSyncRouteTableName     = "eit-uks-alz-t1fw-hasync-udr-01"
t1fwHaSyncRouteNames         = ["s_eit-uks-t1hasync-snet-d_eit-uks-t1ext-snet", "s_eit-uks-t1hasync-snet-d_eit-uks-t1int-snet", "s_eit-uks-t1hasync-snet-d_eit-uks-alz-vnets", "s_eit-uks-t1hasync-snet-d_eit-uks-t1mgmt-snet"]
t1fwHaSyncRoutesNextHopTypes = ["None", "None", "None", "None"]
