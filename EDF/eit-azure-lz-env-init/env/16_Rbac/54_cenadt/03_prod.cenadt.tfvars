environment = "High Secured Central Audit"

################## RBAC to RG ###################
ad_group_01_name        = "EIT-PRD-RBAC-CenAdtHSRG-Contributor"
ad_group_01_description = "Users with the contributor role scoped to eit-uks-alz-hs-cenadt-loga-rg-01 resource group to access LAW."
ad_group_01_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_01_members = ["a8f32ccd-7005-4cee-b3e6-f0a4b998e777",
  "8f6a871f-f657-4322-bfff-28f06e25dc09",
  "eaed96b4-0fcf-41ce-8e76-c2ca36a653ba"
]

role_definition_name01 = "Contributor"
roleassignmetscope01   = "eit-uks-alz-hs-cenadt-loga-rg-01"

ad_group_02_name        = "EIT-PRD-RBAC-CenAdtHSRG-MSSentinel-Responder"
ad_group_02_description = "Microsoft Sentinel Responder"
ad_group_02_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_02_members     = ["20b9be1d-8d18-4920-8739-69d7abbc330b"]
role_definition_name02  = "Microsoft Sentinel Responder"
