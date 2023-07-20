## Secrets KV
mngdhsKvName   = "avmgenprdhsmngdsub01kv"
mngdhsKvRgName = ".security"
environment    = "HS Management"


### PostgreSql

hpbdvdbprodRgName           = "gen-uks-prd-hs-managed-hpb-pddb-rg-01"
hpbdvdbprodServerName       = "genuksprdhspsqlsvr01"
hpbdvdbprodResourceLocation = "UK South"
postgreSqlsku               = "GP_Gen5_2"
postgreSqlstorageMb         = "102400"
backupRetensionDays         = "35"
georedundantBackupEnabled   = "false"
autoGrowEnabled             = "true"
postgreSqlServerVersion     = "11"
sslEnforcementEnabled       = "true"
databaseNames               = ["genuksprdhshpbpddb01", "genuksprdhshpbnpddb01"]
charset                     = "UTF8"
collation                   = "English_United States.1252"


hpbdvdSQLEndPointName          = "genuksprdhspsqlsvr01-pe-01"
privateEndpointVNETRgName      = "gen-uks-prd-hs-managed-vnet-rg-01"
hpbdvdSQLServiceConnName       = "genuksprdhspsqlsvr01-pe-01"
privateEndpointSubResourceName = ["postgresqlServer"]

privateEndpointSubnetName = "gen-uks-prd-hs-pep-snet-01"
privateEndpointVNETName   = "gen-uks-prd-hs-managed-vnet-01"


category1 = "PostgreSQLLogs" #"PostgreSQL Server Logs"
category2 = "QueryStoreRuntimeStatistics"
category3 = "QueryStoreWaitStatistics"
category4 = "AllMetrics"

categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90
