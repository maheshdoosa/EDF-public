environment = "Standard Secured Management"

################## RBAC to RG ###################

SSmgmtKvName   = "avmeitalzssmgmtsub01kv"
SSmgmtKvRgName = ".security"


ad_group_01_name        = "GEN-PRD-RBAC-SS-MGMT-PVTDNS_RG-Reader"
ad_group_01_description = "Users with the Reader role scoped to eit-uks-alz-ss-mgmt-pvtdns-rg resource group to view DNS records."
ad_group_01_owners      = ["d613fedb-ec61-4375-b6b2-a0e03d08bb5a"] ## Jon Allen
ad_group_01_members = ["d7b1a9c6-d75b-45c5-bef8-3ce055b1db33",
  "cb03dc45-0237-404f-95ed-65d1fb1762ab",
  "d613fedb-ec61-4375-b6b2-a0e03d08bb5a",
  "efa6fbd1-84a5-47f8-814c-1c10954759cc",
  "c6f44229-0734-456f-9c4a-62a86c02ed08",
"1c67e1ab-0f4c-4adf-89bb-26baed6c3b17"] ## Colin Auld, Gareth Dunn, Jon Allen, Jonathan Bale, Mark Roberts, Sravan Bitla ##

role_definition_name01 = "Reader"
roleassignmetscope01   = "eit-uks-alz-ss-mgmt-pvtdns-rg"

############## Reader role to Log Analytics workspace RG ###################

ad_group_02_name        = "GEN-PRD-RBAC-SS-MGMT-LOG-ANALYTICS_RG-Reader"
ad_group_02_description = "Users with the Reader role scoped to eit-uks-alz-ss-loga-rg resource group to view see all monitoring data."
ad_group_02_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"] ## SVL-AZ-Wayne.Crow@edfenergynnb.onmicrosoft.com
ad_group_02_members     = ["03f09c04-8ba0-4889-b66f-6100a2b3d59e"] ## SVL-AZ-Dipak.Borole@edfenergynnb.onmicrosoft.com

role_definition_name02 = "Reader"
roleassignmetscoperg   = "eit-uks-alz-ss-loga-rg"
roleassignmetscope02   = "eit-uks-alz-ss-loga-01"
