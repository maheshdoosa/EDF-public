environment = "Staging"

managedGenHSKvName   = "avmgenprdhsmngdsub1kv"
managedGenHSKvRgName = ".security"

comsySQLPaaSRgName                 = "ab-stgcomsytestsqlrg"
ComsyHSResourceLocation            = "UK South"
comsySQLServerName                 = "abstgcomsytestsql-01"
comsySqlServerVersion              = "12.0"
comsySqlPrivateEndpointDecision    = "true"
comsySqlDBNames                    = ["stgsqltestdb1"]
comsySqldbname                     = "stgsqltestdb1"
comsySqlDBMaxSize                  = "4"
comsySqlDBSkuName                  = "GP_Gen5_2"
comsySqlDBZoneRedundantDecision    = "true"
comsySqlDBFailoverDecision         = "false"
comsySqlDBFailoverLocation         = "null"
endpointFailoverPolicyModeDecision = "Automatic"
privateEndpointSubnetName          = "comsysqltest-snet-01"
privateEndpointVNETName            = "devops-build-vnet"
privateEndpointVNETRgName          = "devops-build"
comsySQLEndPointName               = "comsytestsqlpe"
privateEndpointSubResourceName     = ["sqlServer"]
comsySQLServiceConnName            = "comsytestsqlpesc"
#privateEndpointConnectionEnabled   = "true" // updated

azuread_authentication_only = "false"
sqldbazureadgroup           = "test_ad_group02_sandpit_for_customrole"
