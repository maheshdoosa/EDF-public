environment = "Test"

cenadtKvName   = "eitlzmanagementhsk"
cenadtKvRgName = ".security"

cenadtResourceLocation = "UK South"
cenadtSubLogsRgName    = "eit-uks-alz-tst-audit-rg-01"
subLogsSA              = "eituktestauditsa01"

subLogsSAImmutabilityRetentionPeriod = 1                                    ## for testing only
tenantId                             = "azlzstagingSpnTenantIdSecret"       //key vault secret name as value
SubscriptionId                       = "azlzstagingSpnSubscriptionIdSecret" //key vault secret name as value
cenadtContributorSPAppId             = "azlzstagingSPIdSecret"              //key vault secret name as value
cenadtContributorSPSecret            = "azlzstagingSPKeySecret"             //key vault secret name as value
