environment = "High Secured Lower"

################## RBAC to RG ###################
ad_group_01_name        = "GEN-PRD-LWR-RBAC-GenDiaLwrHSRG-Contributor"
ad_group_01_description = "Users with the contributor role scoped to access RGs."
ad_group_01_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_01_members     = ["5f224023-9bf4-4c69-895f-ee5b51cba48a"]

role_definition_name01 = "Contributor"
roleassignmetscope01   = "gen-uks-lwr-hs-wkload-vnet-rg-01"
roleassignmetscope02   = "gen-uks-lwr-hs-wkload-rg-01"
roleassignmetscope03   = "gen-uks-lwr-hs-wkload-rsv-rg-01"


################## 04 RBAC to RG ###################
ad_group_04_name        = "GEN-PRD-LWR-RBAC-GenDiaLwrHSRG-Reader"
ad_group_04_description = "Users with the reader role scoped to access RGs."
ad_group_04_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_04_members     = ["1d41ac1f-0ff6-4841-a09c-7f19076896fa"]

role_definition_name04 = "Reader"
roleassignmetscope04   = "gen-uks-lwr-hs-wkload-bastion-rg-01"

role_definition_name05 = "Virtual Machine User Login"
roleassignmetscope05   = "gen-uks-pre-hs-sql2k16-rg"
