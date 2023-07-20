environment = "Standard Secured Management"
################ RG Creation #####################################
rgs = {
  eit-uks-alz-ss-mgmt-pvtdns-rg = {
    enable   = true
    location = "UK South"
  }
}
############### Zone Creation ###################################
pvtdnszones = [
  {
    zone   = "privatelink.azure.com"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.blob.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.database.windows.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.datafactory.azure.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.dev.azuresynapse.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.dfs.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.file.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.queue.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.sql.azuresynapse.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.web.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.table.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.vault.azure.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.vaultcore.azure.net"
    enable = true
    rg     = "eit-uks-alz-ss-mgmt-pvtdns-rg"
  }
]
############# Vnet Link to Zone #######################################
vnetlinkpvtdnszones = [
  {
    vnet                = "/subscriptions/34683308-7f6c-426c-9d9c-6826ab02c846/resourceGroups/eit-uks-alz-ss-mgmt-vnet-rg/providers/Microsoft.Network/virtualNetworks/eit-uks-alz-ss-mgmt-vnet-01"
    vnet_dns_link_name  = "eit-uks-alz-ss-mgmt-vnet-01-dnslink"
    resource_group_name = "eit-uks-alz-ss-mgmt-pvtdns-rg"
    private_dns_zone_name = ["privatelink.azure.com",
      "privatelink.blob.core.windows.net",
      "privatelink.database.windows.net",
      "privatelink.datafactory.azure.net",
      "privatelink.dev.azuresynapse.net",
      "privatelink.dfs.core.windows.net",
      "privatelink.file.core.windows.net",
      "privatelink.queue.core.windows.net",
      "privatelink.sql.azuresynapse.net",
      "privatelink.web.core.windows.net",
      "privatelink.table.core.windows.net",
      "privatelink.vault.azure.net",
      "privatelink.vaultcore.azure.net"
    ]
  }
]
# ################## RBAC to RG ###################

# SSmgmtKvName   = "avmeitalzssmgmtsub01kv"
# SSmgmtKvRgName = ".security"


# ad_group_01_name        = "GEN-PRD-RBAC-SS-MGMT-PVTDNS_RG-Reader"
# ad_group_01_description = "Users with the Reader role scoped to eit-uks-alz-ss-mgmt-pvtdns-rg resource group to view DNS records."
# ad_group_01_owners      = ["d613fedb-ec61-4375-b6b2-a0e03d08bb5a"]
# ad_group_01_members     = ["d7b1a9c6-d75b-45c5-bef8-3ce055b1db33",
#                            "cb03dc45-0237-404f-95ed-65d1fb1762ab",
#                            "d613fedb-ec61-4375-b6b2-a0e03d08bb5a",
#                            "efa6fbd1-84a5-47f8-814c-1c10954759cc",
#                            "c6f44229-0734-456f-9c4a-62a86c02ed08",
#                            "1c67e1ab-0f4c-4adf-89bb-26baed6c3b17"]

# role_definition_name01 = "Reader"
# roleassignmetscope01   = "eit-uks-alz-ss-mgmt-pvtdns-rg"
