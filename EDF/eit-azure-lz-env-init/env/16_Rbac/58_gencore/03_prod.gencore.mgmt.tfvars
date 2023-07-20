environment = "High Secured Management"

################## RBAC to RG ###################
ad_group_01_name        = "GEN-PRD-RBAC-HS-MgmtSub-PrivateDNSContributor"
ad_group_01_description = "Users with the PrivateDNSContributor role scoped to eit-uks-alz-hs-mgmt-pvtdns-rg resource group to manage DNS records."
ad_group_01_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_01_members = ["19041d46-a2c9-4a11-a385-6609a2383a6f",
  "bed9d60e-6cbe-49d9-bab6-a4fc36f46448",
  "99899339-8fca-4595-9911-5ae5f9563596",
  "ff43e144-f6f2-45a2-aba1-133f465c1ffe",
  "e77ec08f-84f5-4c3a-917b-31735b26c828",
  "fdef16a6-0037-4c6b-bdc4-cea5879f83ba",
"9c6bff74-c4f5-4149-8f8a-61cd4de32ce2"]

role_definition_name01 = "Private DNS Zone Contributor"
roleassignmetscope01   = "g-uks-prd-hs-mgmt-pvtdns-rg"
