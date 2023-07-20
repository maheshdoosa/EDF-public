environment = "High Secured Upper"

# ################## RBAC to RG ###################
ad_group_01_name        = "GEN-PRD-UPR-RBAC-GenDiaUprHSRG-Contributor"
ad_group_01_description = "Users with the contributor role scoped to access RGs."
ad_group_01_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_01_members     = ["a1bf1b24-c0f5-4340-ae1e-924c5169d70a"]

role_definition_name01 = "Contributor"
roleassignmetscope01   = "gen-uks-upr-hs-wkload-vnet-rg-01"
roleassignmetscope02   = "gen-uks-upr-hs-wkload-rsv-rg-01"
# roleassignmetscope03   = "gen-uks-upr-hs-wkload-rg-01"

################## 04 RBAC to RG ###################
ad_group_04_name        = "GEN-PRD-UPR-RBAC-GenDiaLwrHSRG-Reader"
ad_group_04_description = "Users with the reader role scoped to access RGs."
ad_group_04_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_04_members     = ["1d41ac1f-0ff6-4841-a09c-7f19076896fa"]

role_definition_name04 = "Reader"
roleassignmetscope04   = "gen-uks-upr-hs-wkload-bastion-rg-01"

role_definition_name05 = "Virtual Machine User Login"
roleassignmetscope05   = "gen-uks-prd-hs-sql2k16-rg"
