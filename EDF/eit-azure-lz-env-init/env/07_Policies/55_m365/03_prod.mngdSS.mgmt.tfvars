m365KvName   = "avmeitprdssmngdsub01kv"
m365KvRgName = ".security"


ad_group_01_name        = "EIT-PRD-RBAC-SS-M366_RG-AutoJobOps"
ad_group_01_description = "create and jobs using automation runbooks"
ad_group_01_owners      = []
ad_group_01_members = ["94262c4d-1cf0-4768-900d-7eb280c8973f",
"ac0f203f-04c2-41a0-a581-aeb3e8b6b9cb"]

ad_group_02_name        = "EIT-PRD-RBAC-SS-M366_RG-AutoOps"
ad_group_02_description = "to start/stop/suspend/resume jobs"
ad_group_02_owners      = []
ad_group_02_members = ["94262c4d-1cf0-4768-900d-7eb280c8973f",
"ac0f203f-04c2-41a0-a581-aeb3e8b6b9cb"]

ad_group_03_name        = "EIT-PRD-RBAC-SS-M366_RG-AutoRunbookOps"
ad_group_03_description = "create jobs for the runbooks"
ad_group_03_owners      = []
ad_group_03_members = ["94262c4d-1cf0-4768-900d-7eb280c8973f",
"ac0f203f-04c2-41a0-a581-aeb3e8b6b9cb"]

ad_group_04_name        = "EIT-PRD-RBAC-SS-M366_RG-StorBlobDataContributor"
ad_group_04_description = "the ability to Read/Write/Delete Blobs"
ad_group_04_owners      = []
ad_group_04_members = ["94262c4d-1cf0-4768-900d-7eb280c8973f",
"ac0f203f-04c2-41a0-a581-aeb3e8b6b9cb"]

role_definition_name01 = "Automation Job Operator"
role_definition_name02 = "Automation Operator"
role_definition_name03 = "Automation Runbook Operator"
role_definition_name04 = "Storage Blob Data Contributor"
roleassignmetscope01   = "eit-uks-prd-ss-m365-rg"
