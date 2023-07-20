rgs = {
  PvtDNStestRG-01 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "sandpit"
    }
  },
  PvtDNStestRG-02 = {
    enable   = true
    location = "UK South"
    tags = {
      environment = "sandpit"
    }
  }
}

pvtdnszones = [
  {
    zone   = "privatelink.azure.com"
    enable = true
    rg     = "PvtDNStestRG-01"
  },
  {
    zone   = "privatelink.blob.core.windows.net"
    enable = true
    rg     = "PvtDNStestRG-02"
  },
  {
    zone   = "privatelink.datafactory.azure.net"
    enable = true
    rg     = "PvtDNStestRG-01"
  }
]
