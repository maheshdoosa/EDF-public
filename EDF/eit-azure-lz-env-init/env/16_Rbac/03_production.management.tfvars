environment = "High Secured Management"

################## RBAC to RG ###################
ad_group_01_name        = "GEN-PRD-RBAC-HS-MGMT-PVTDNS_RG-Reader"
ad_group_01_description = "Users with the Reader role scoped to eit-uks-alz-hs-mgmt-pvtdns-rg resource group to view DNS records."
ad_group_01_owners      = ["d613fedb-ec61-4375-b6b2-a0e03d08bb5a"]
ad_group_01_members = ["d7b1a9c6-d75b-45c5-bef8-3ce055b1db33",
  "cb03dc45-0237-404f-95ed-65d1fb1762ab",
  "d613fedb-ec61-4375-b6b2-a0e03d08bb5a",
  "efa6fbd1-84a5-47f8-814c-1c10954759cc",
  "c6f44229-0734-456f-9c4a-62a86c02ed08",
"1c67e1ab-0f4c-4adf-89bb-26baed6c3b17"]

role_definition_name01 = "Reader"
roleassignmetscope01   = "eit-uks-alz-hs-mgmt-pvtdns-rg"

###################

HSmgmtKvName   = "eitlzmanagementhskv"
HSmgmtKvRgName = ".security"

role_definition_name02 = "Virtual Machine Basic Operator for HS"


###########################################

role_definition_devOps_name01 = "Contributor"
EITDevopsAppRgName            = "eit-uks-alz-hs-devops-app-rg-01"
EITDevopsPackerRgName         = "eit-uks-alz-hs-devops-packer-rg-01"
EITDevopsctrlplaneRgName      = "eit-uks-alz-hs-devops-ctrlplane-rg-01"

########### 03 RBAC #######################

################## RBAC to RG ###################
ad_group_03_name        = "EIT-PRD-RBAC-HS-MgmtSub-PrivateDNSContributor"
ad_group_03_description = "Users with the DNS contributor role scoped to eit-uks-alz-hs-mgmt-pvtdns-rg resource group to manage DNS records."
ad_group_03_owners      = ["d5d939fc-7a73-46a0-abf6-b41d95a7b286"]
ad_group_03_members = ["19041d46-a2c9-4a11-a385-6609a2383a6f",
  "bed9d60e-6cbe-49d9-bab6-a4fc36f46448",
  "99899339-8fca-4595-9911-5ae5f9563596",
  "ff43e144-f6f2-45a2-aba1-133f465c1ffe",
  "e77ec08f-84f5-4c3a-917b-31735b26c828",
  "fdef16a6-0037-4c6b-bdc4-cea5879f83ba",
  "9c6bff74-c4f5-4149-8f8a-61cd4de32ce2",
  "d7b1a9c6-d75b-45c5-bef8-3ce055b1db33",
"d613fedb-ec61-4375-b6b2-a0e03d08bb5a"]

role_definition_name03 = "Private DNS Zone Contributor"
roleassignmetscope03   = "eit-uks-alz-hs-mgmt-pvtdns-rg"
