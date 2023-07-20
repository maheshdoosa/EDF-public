KvName   = "eitlztransitkv"
KvRgName = ".security"

Transitvnet   = "eit-uks-alz-transit-vnet-01"
TransitvnetRG = "eit-uks-alz-transit-vnet-rg"
Remotevnet    = "dmd-aze-uks-mgt-vnet-01"
RemotevnetRG  = "dmd-aze-uks-mgt-rg-01"


vnet_peering = {
  peer-Transit-Remote = {
    enable    = true
    peer1name = "eit-uks-alz-transit-vnet-01-dmd-aze-uks-mgt-vnet-01"
    peer2name = "dmd-aze-uks-mgt-vnet-01-eit-uks-alz-transit-vnet-01"
    vnet1name = "eit-uks-alz-transit-vnet-01"
    vnet1rg   = "eit-uks-alz-transit-vnet-rg"
    vnet2name = "dmd-aze-uks-mgt-vnet-01"
    vnet2rg   = "dmd-aze-uks-mgt-rg-01"
  }
}

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = true
UseRemoteGateways         = false
