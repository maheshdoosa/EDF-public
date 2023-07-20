########## Data Source AKV ####################################

KvName   = "avmgenprdhsmgmtsub01kv"
KvRgName = ".security"

environment = "High Secured Managed"
################ RG Creation #####################################

rgs = {
  g-uks-prd-hs-mgmt-pvtdns-rg = {
    enable   = true
    location = "UK South"
  }
}

############### Zone Creation ###################################
pvtdnszones = [
  {
    zone   = "privatelink.agentsvc.azure-automation.net"
    enable = true
    rg     = "g-uks-prd-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.azure-automation.net"
    enable = true
    rg     = "g-uks-prd-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.blob.core.windows.net"
    enable = true
    rg     = "g-uks-prd-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.monitor.azure.com"
    enable = true
    rg     = "g-uks-prd-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.ods.opinsights.azure.com"
    enable = true
    rg     = "g-uks-prd-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.oms.opinsights.azure.com"
    enable = true
    rg     = "g-uks-prd-hs-mgmt-pvtdns-rg"
  },
  {
    zone   = "privatelink.vaultcore.azure.net"
    enable = true
    rg     = "g-uks-prd-hs-mgmt-pvtdns-rg"
  }
]

#################### A Record Creation #######################################################
######## Design the code name must be an unique and record values fetch from AKV #############

pvtdnszoneArecords = [
  {
    name     = "309ca690-31fe-48ae-b6e8-b4dd022e107c"
    zonename = "privatelink.agentsvc.azure-automation.net"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-agentsvc"
  },
  {
    name     = "6f3300c2-0d8e-48ce-970f-c070108d4905.agentsvc.uks"
    zonename = "privatelink.azure-automation.net"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-automation-01"
  },
  {
    name     = "6f3300c2-0d8e-48ce-970f-c070108d4905.jrds.uks"
    zonename = "privatelink.azure-automation.net"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-automation-02"
  },
  {
    name     = "scadvisorcontentpl"
    zonename = "privatelink.blob.core.windows.net"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-storage"
  },
  {
    name     = "global.in.ai"
    zonename = "privatelink.monitor.azure.com"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-monitor-01"
  },
  {
    name     = "api"
    zonename = "privatelink.monitor.azure.com"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-monitor-02"
  },
  {
    name     = "global.handler.control"
    zonename = "privatelink.monitor.azure.com"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-monitor-03"
  },
  {
    name     = "diagservices-query"
    zonename = "privatelink.monitor.azure.com"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-monitor-04"
  },
  {
    name     = "live"
    zonename = "privatelink.monitor.azure.com"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-monitor-05"
  },
  {
    name     = "profiler"
    zonename = "privatelink.monitor.azure.com"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-monitor-06"
  },
  {
    name     = "snapshot"
    zonename = "privatelink.monitor.azure.com"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 10
    record   = "private-dns-monitor-07"
  },
  {
    name     = "genuksuprhswkloadstg"
    zonename = "privatelink.blob.core.windows.net"
    rg       = "g-uks-prd-hs-mgmt-pvtdns-rg"
    ttl      = 3600
    record   = "private-dns-genuksuprhswkloadstg"
  }
]

########### below two of the record name were duplicated so created using direct modules  ##################

name01                = "309ca690-31fe-48ae-b6e8-b4dd022e107c"
zone_name01           = "privatelink.ods.opinsights.azure.com"
resource_group_name01 = "g-uks-prd-hs-mgmt-pvtdns-rg"
ttl01                 = 10

name02                = "309ca690-31fe-48ae-b6e8-b4dd022e107c"
zone_name02           = "privatelink.oms.opinsights.azure.com"
resource_group_name02 = "g-uks-prd-hs-mgmt-pvtdns-rg"
ttl02                 = 10
