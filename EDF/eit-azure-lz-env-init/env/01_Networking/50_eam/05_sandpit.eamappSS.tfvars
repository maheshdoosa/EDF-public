environment = "Live"

#eamAppSS resource group
eamAppSSNetworkingRgName = "gen-uks-tst-ss-wkload-vnet-rg-01"

#eamAppSS key vault
eamAppSSKvName   = "eitgeneration"
eamAppSSKvRgName = ".security"

#eamAppSS networking
eamAppSSVnetName                   = "gen-uks-tst-ss-wkload-vnet-01"
eamAppSSNetworkingResourceLocation = "uksouth"

eamAppSSSubnets = [
  {
    subnetName = "gen-uks-tst-ss-eam-dv-snet-01"
    newBits    = 5
    netNum     = 0
  },
  {
    subnetName = "gen-uks-tst-ss-eam-st-snet-01"
    newBits    = 5
    netNum     = 1
  },
  {
    subnetName = "gen-uks-tst-ss-eam-shared-snet-01"
    newBits    = 4
    netNum     = 1
  }
]

#Eamwkld networking
dvSubnetName = "gen-uks-tst-ss-eam-dv-snet-01"
stSubnetName = "gen-uks-tst-ss-eam-st-snet-01"
shSubnetName = "gen-uks-tst-ss-eam-shared-snet-01"

# Peering

vnet_peering = {
  peer-hub-spoke = {
    enable    = true
    peer1name = "az-lz-hub-to-spoke"
    peer2name = "az-lz-spoke-to-hub"
    vnet2name = "gen-uks-tst-ss-wkload-vnet-01"
    vnet2rg   = "gen-uks-tst-ss-wkload-vnet-rg-01"
    vnet1name = "az-lz-test-transit-networking-hub"
    vnet1rg   = "az-lz-test-transit-networking"
  }
}

tenantId            = "stagingTenantId"
hubSubscriptionId   = "sandpitSubscriptionId"
spokeSubscriptionId = "stagingSubscriptionId"

AllowVirtualNetworkAccess = true
AllowForwardedTraffic     = true
AllowGatewayTransitVNet12 = true
AllowGatewayTransitVNet21 = false
UseRemoteGateways         = false

#Route Tables
dvRouteTableName = "gen-uks-tst-ss-eam-dv-udr-01"
dvRouteNames     = ["s_gen-uks-tst-ss-eam-dv-snet-d_On-Prem-Internet", "s_gen-uks-tst-ss-eam-dv-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-ss-eam-dv-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-ss-eam-dv-snet-d_eit-uks-alz-hs-mgmt-vnet"]
dvNextHopTypes   = ["VirtualAppliance", "None", "None", "None"]

stRouteTableName = "gen-uks-tst-ss-eam-st-udr-01"
stRouteNames     = ["s_gen-uks-tst-ss-eam-st-snet-d_On-Prem-Internet", "s_gen-uks-tst-ss-eam-st-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-ss-eam-st-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-ss-eam-st-snet-d_eit-uks-alz-hs-mgmt-vnet"]
stNextHopTypes   = ["VirtualAppliance", "None", "None", "None"]

shRouteTableName = "gen-uks-tst-ss-eam-shared-udr-01"
shRouteNames     = ["s_gen-uks-tst-ss-eam-shared-snet-d_On-Prem-Internet", "s_gen-uks-tst-ss-eam-shared-snet-d_eit-uks-alz-t2-mgmt-snet", "s_gen-uks-tst-ss-eam-shared-snet-d_eit-uks-alz-t1-snet", "s_gen-uks-tst-ss-eam-shared-snet-d_eit-uks-alz-hs-mgmt-vnet"]
shNextHopTypes   = ["VirtualAppliance", "None", "None", "None"]
