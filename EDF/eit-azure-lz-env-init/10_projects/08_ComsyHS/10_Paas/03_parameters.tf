variable "environment" {
  description = "environment"
  default     = ".tmp"
  type        = string
}
variable "managedGenHSKvName" {
  description = "Key vault name where keys and secrets are stored"
  default     = ".tmp"
  type        = string
}

variable "managedGenHSKvRgName" {
  description = "resoruce group of Key vault name where keys and secrets are stored"
  default     = ".tmp"
  type        = string
}

variable "comsySQLPaaSRgName" {
  description = "resoruce group of SQL Server"
  default     = ".tmp"
  type        = string
}

variable "comsySQLPaaSResourceLocation" {
  description = "Location where resoruces are being deployed"
  default     = "Uk South"
}

variable "comsySQLServerName" {
  type        = string
  description = "The name of the Azure SQL Server"
  default     = ".tmp"
}


variable "comsySqlServerVersion" {
  description = "version Azure SQL Server"
  default     = ".tmp"
  type        = string
}

variable "comsySqlPrivateEndpointDecision" {
  description = "Private endpoint for SQL to be deployed or not. Decision will be true or false"
  default     = "false"
  type        = string
}


variable "comsySqlDBNames" {
  type        = list(string)
  description = "List of Azure SQL database names"
  default     = []

}

variable "comsySqlDBMaxSize" {
  type        = number
  description = "The max size of the database in gigabytes"
  default     = "4"

}

variable "comsySqlDBSkuName" {
  type        = string
  description = "Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
  default     = "GP_Gen4_2" # for example "The sku-name parameter consists of 3 parts: Tier (B for Basic, GP for General Purpose, MO for Memory Optimized), Compute (Gen4 or Gen5), and Scale (1-32 vCores) -for example, GPGen42.

}

variable "comsySqlDBZoneRedundantDecision" {
  type        = bool
  description = "Specifies whether SQL DB will be zone Redundant or not. Possible values are true or false"
  default     = "true"

}

variable "comsySqlDBFailoverDecision" {

  type        = bool
  description = "If set to true, enable failover Azure SQL Server"
  default     = "false"

}

variable "comsySqlDBFailoverLocation" {
  type        = string
  description = "Specifies the supported Azure location where the failover Azure SQL Server exists"
  default     = "null"
}

variable "endpointFailoverPolicyModeDecision" {
  type        = string
  description = "The failover mode. Possible values are Manual, Automatic"
  default     = "Automatic"

}

variable "privateEndpointSubnetName" {
  description = "Name of the Subnet where Private endpoint for Comsy SQL will be created"
  default     = ".tmp"
  type        = string
}

variable "privateEndpointVNETName" {

  description = "Name of the VNET where Private endpoint for Comsy SQL will be created"
  default     = ".tmp"
  type        = string
}

variable "privateEndpointVNETRgName" {
  description = "Name of the networking (VNET) resoruce group where Private endpoint for Comsy SQL will be created"
  default     = ".tmp"
  type        = string
}

variable "comsySQLEndPointName" {
  description = "Name of Private Endpoint for SQL PaaS"
  default     = ".tmp"
  type        = string
}

variable "comsySQLServiceConnName" {
  description = "Service connection name which is created for SQL PaaS "
  default     = ".tmp"
  type        = string
}
variable "privateEndpointSubResourceName" {
  description = "Private endpoint subresoruce names can be reffered here https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview "
  default     = [".tmp"]
  type        = list(string)
}
variable "comsySQLLinkScopeId" {
  description = "Linkscope ID for the  "
  default     = ".tmp"
  type        = string
}

variable "comsySqldbname" {
  description = "comsySqldbname"
  default     = ".tmp"
  type        = string
}

variable "azuread_authentication_only" {
  type        = string
  description = "azuread_authentication_only"
  #default     = "Automatic"
}

variable "sqldbazureadgroup" {
  type        = string
  description = "sqldbazureadgroup"
  #default     = "Automatic"
}

########## SQL database diag settings ##########
variable "categoryenabledtrue" {
  default = null
  type    = bool
}
variable "categoryenabledfalse" {
  default = null
  type    = bool
}

variable "retention_policy_enabled_true" {
  default = null
  type    = bool
}
variable "retention_policy_enabled_false" {
  default = null
  type    = bool
}

variable "retention_policydays" {
  default = null
  type    = number
}

variable "diagnostic_log" {
  default = []
  type    = list(any)
}

variable "category1" {
  default = "null"
  type    = string
}
variable "category2" {
  default = "null"
  type    = string
}
variable "category3" {
  default = "null"
  type    = string
}
variable "category4" {
  default = "null"
  type    = string
}
variable "category5" {
  default = "null"
  type    = string
}
variable "category6" {
  default = "null"
  type    = string
}
variable "category7" {
  default = "null"
  type    = string
}
variable "category8" {
  default = "null"
  type    = string
}
variable "category9" {
  default = "null"
  type    = string
}
variable "category10" {
  default = "null"
  type    = string
}
variable "category11" {
  default = "null"
  type    = string
}
variable "category12" {
  default = "null"
  type    = string
}
variable "category13" {
  default = "null"
  type    = string
}
variable "category14" {
  default = "null"
  type    = string
}
variable "category15" {
  default = "null"
  type    = string
}
