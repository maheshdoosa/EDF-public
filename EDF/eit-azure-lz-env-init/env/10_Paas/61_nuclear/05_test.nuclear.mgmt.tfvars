## Secrets KV
mngdhsKvName   = "avmgentsthsmngdsub01kv"
mngdhsKvRgName = ".security"
environment    = "HS Management"


### PostgreSql

hpbdvdbdevRgName           = "gen-uks-dev-hs-managed-hpb-dvdb-rg-01"
hpbdvdbdevServerName       = "genuksdevhspsqlsvr01"
hpbdvdbdevResourceLocation = "UK South"
postgreSqlsku              = "GP_Gen5_2"
postgreSqlstorageMb        = "102400"
backupRetensionDays        = "35"
georedundantBackupEnabled  = "false"
autoGrowEnabled            = "true"
postgreSqlServerVersion    = "11"
sslEnforcementEnabled      = "true"
databaseNames              = ["genuksdevhshpbdvdb01"]
charset                    = "UTF8"
collation                  = "English_United States.1252"


hpbdvdSQLEndPointName          = "genuksdevhspsqlsvr01-pe-01"
privateEndpointVNETRgName      = "gen-uks-dev-hs-managed-vnet-rg-01"
hpbdvdSQLServiceConnName       = "genuksdevhspsqlsvr01-pe-01"
privateEndpointSubResourceName = ["postgresqlServer"]

privateEndpointSubnetName = "gen-uks-dev-hs-pep-snet-01"
privateEndpointVNETName   = "gen-uks-dev-hs-managed-vnet-01"


category1 = "PostgreSQLLogs" #"PostgreSQL Server Logs"
category2 = "QueryStoreRuntimeStatistics"
category3 = "QueryStoreWaitStatistics"
category4 = "AllMetrics"

categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90
