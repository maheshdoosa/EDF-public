############### Networking - VNet Peering ###############

module "createVNetPeering" {
  count = var.vnet_peering["peer-Transit-Remote"]["enable"] == true ? 1 : 0
  providers = {
    azurerm.src = azurerm.Transit
    azurerm.dst = azurerm.Remote
  }
  source                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnetpeering-multiple-subs?ref=v1.0.0"
  vNet1ResourceGroupName = var.vnet_peering["peer-Transit-Remote"]["vnet1rg"]
  vNet2ResourceGroupName = var.vnet_peering["peer-Transit-Remote"]["vnet2rg"]

  peerNameVNet12 = var.vnet_peering["peer-Transit-Remote"]["peer1name"]
  peerNameVNet21 = var.vnet_peering["peer-Transit-Remote"]["peer2name"]
  vNet1Name      = var.vnet_peering["peer-Transit-Remote"]["vnet1name"]
  vNet1Id        = data.azurerm_virtual_network.Transit.id
  vNet2Name      = var.vnet_peering["peer-Transit-Remote"]["vnet2name"]
  vNet2Id        = data.azurerm_virtual_network.Remote.id

  AllowVirtualNetworkAccess = var.AllowVirtualNetworkAccess
  AllowForwardedTraffic     = var.AllowForwardedTraffic
  AllowGatewayTransitVNet12 = var.AllowGatewayTransitVNet12
  AllowGatewayTransitVNet21 = var.AllowGatewayTransitVNet21
  UseRemoteGateways         = var.UseRemoteGateways
}
