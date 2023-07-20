environment = "High Secured Management"

KvName   = "eitlzmanagementhskv"
KvRgName = ".security"

################ RG Creation #####################################
rgs = {
  eit-uks-alz-hs-mgmt-pvtdns-rg = {
    enable   = true
    location = "UK South"
  }
}

############### Zone Creation ###################################
pvtdnszones = [
  {
    zone   = "privatelink.azure.com"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.blob.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.database.windows.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.datafactory.azure.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.dev.azuresynapse.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.dfs.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.file.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.queue.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.sql.azuresynapse.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.web.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.table.core.windows.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.vault.azure.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.vaultcore.azure.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.azurewebsites.net"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "uks.backup.windowsazure.com"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.postgres.database.azure.com"
    enable = true
    rg     = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  }
]

############# Vnet Link to Zone #######################################
vnetlinkpvtdnszones = [
  {
    vnet                = "eit-uks-alz-hs-mgmt-vnet-01"
    vnet_dns_link_name  = "eit-uks-alz-hs-mgmt-vnet-01-dnslink"
    resource_group_name = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    private_dns_zone_name = ["privatelink.azure.com",
      "privatelink.database.windows.net",
      "privatelink.dev.azuresynapse.net",
      "privatelink.dfs.core.windows.net",
      "privatelink.queue.core.windows.net",
      "privatelink.sql.azuresynapse.net",
      "privatelink.web.core.windows.net",
      "privatelink.table.core.windows.net",
      "privatelink.vault.azure.net",
      "privatelink.vaultcore.azure.net",
      "privatelink.blob.core.windows.net",
      "privatelink.datafactory.azure.net",
      "privatelink.file.core.windows.net",
      "privatelink.azurewebsites.net",
      "uks.backup.windowsazure.com",
      "privatelink.postgres.database.azure.com"
    ]
  }
]

pvtdnszoneArecords = [
  {
    name     = "genuksuprhswkloadkvt01"
    zonename = "privatelink.vaultcore.azure.net"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-genuksuprhswkloadkvt01"
  },
  {
    name     = "5892835050346582250-ab-pod01-prot1c"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-prot1c"
  },
  {
    name     = "5892835050346582250-ab-pod01-tel1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-tel1"
  },
  {
    name     = "5892835050346582250-ab-pod01-fab1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-fab1"
  },
  # {
  #   name       = "5892835050346582250-ab-pod01-prot1"
  #   zonename   = "uks.backup.windowsazure.com"
  #   rg         = "eit-uks-alz-hs-mgmt-pvtdns-rg"
  #   ttl        = 10
  #   record     = "private-dns-prot1"
  # },
  {
    name     = "5892835050346582250-ab-pod01-rec2"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-rec2"
  },
  {
    name     = "5892835050346582250-ab-pod01-prot1b"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-prot1b"
  },
  {
    name     = "5892835050346582250-ab-pod01-ecs1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-ecs1"
  },
  {
    name     = "5892835050346582250-ab-pod01-prot1d"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-prot1d"
  },
  {
    name     = "5892835050346582250-ab-pod01-id1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-id1"
  },
  {
    name     = "5892835050346582250-ab-pod01-fc1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-fc1"
  },
  {
    name     = "5892835050346582250-ab-pod01-wbcm1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-wbcm1"
  },
  {
    name     = "8191508985316577080-ab-pod01-ecs1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-ecs1"
  },
  {
    name     = "8191508985316577080-ab-pod01-fab1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-fab1"
  },
  {
    name     = "8191508985316577080-ab-pod01-fc1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-fc1"
  },
  {
    name     = "8191508985316577080-ab-pod01-id1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-id1"
  },
  {
    name     = "8191508985316577080-ab-pod01-prot1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-prot1"
  },
  {
    name     = "8191508985316577080-ab-pod01-prot1b"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-prot1b"
  },
  {
    name     = "8191508985316577080-ab-pod01-prot1c"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-prot1c"
  },
  {
    name     = "8191508985316577080-ab-pod01-prot1d"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-819-prot1d"
  },
  {
    name     = "8191508985316577080-ab-pod01-rec2"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-819-rec2"
  },
  {
    name     = "8191508985316577080-ab-pod01-tel1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-819-tel1"
  },
  {
    name     = "8191508985316577080-ab-pod01-wbcm1"
    zonename = "uks.backup.windowsazure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-819-wbcm1"
  },
  {
    name     = "genuksprdhspsqlsvr01"
    zonename = "privatelink.postgres.database.azure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-HPB-prdPstgreSQL"
  },
  {
    name     = "genuksdevhspsqlsvr01"
    zonename = "privatelink.postgres.database.azure.com"
    rg       = "eit-uks-alz-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-HPB-devPostgreSQL"
  }
]
# ################## RBAC to RG ###################

# HSmgmtKvName   = "eitlzmanagementhskv"
# HSmgmtKvRgName = ".security"


# ad_group_01_name        = "GEN-PRD-RBAC-HS-MGMT-PVTDNS_RG-Reader"
# ad_group_01_description = "Users with the Reader role scoped to eit-uks-alz-hs-mgmt-pvtdns-rg resource group to view DNS records."
# ad_group_01_owners      = ["d613fedb-ec61-4375-b6b2-a0e03d08bb5a"]
# ad_group_01_members     = ["d7b1a9c6-d75b-45c5-bef8-3ce055b1db33",
#                            "cb03dc45-0237-404f-95ed-65d1fb1762ab",
#                            "d613fedb-ec61-4375-b6b2-a0e03d08bb5a",
#                            "efa6fbd1-84a5-47f8-814c-1c10954759cc",
#                            "c6f44229-0734-456f-9c4a-62a86c02ed08",
#                            "1c67e1ab-0f4c-4adf-89bb-26baed6c3b17"]

# role_definition_name01 = "Reader"
# roleassignmetscope01   = "eit-uks-alz-hs-mgmt-pvtdns-rg"
