m365KvName   = "eitsandstoragesecrets"
m365KvRgName = ".security"


ad_group_01_name        = "EIT-PRD-RBAC-SS-M366_RG-AutoJobOps"
ad_group_01_description = "create and jobs using automation runbooks"
ad_group_01_owners      = []
ad_group_01_members     = []

ad_group_02_name        = "EIT-PRD-RBAC-SS-M366_RG-AutoOps"
ad_group_02_description = "to start/stop/suspend/resume jobs"
ad_group_02_owners      = []
ad_group_02_members     = []

ad_group_03_name        = "EIT-PRD-RBAC-SS-M366_RG-AutoRunbookOps"
ad_group_03_description = "create jobs for the runbooks"
ad_group_03_owners      = []
ad_group_03_members     = []

ad_group_04_name        = "EIT-PRD-RBAC-SS-M366_RG-StorBlobDataContributor"
ad_group_04_description = "the ability to Read/Write/Delete Blobs"
ad_group_04_owners      = []
ad_group_04_members     = []

role_definition_name01 = "Automation Job Operator"
role_definition_name02 = "Automation Operator"
role_definition_name03 = "Automation Runbook Operator"
role_definition_name04 = "Storage Blob Data Contributor"
roleassignmetscope01   = "eit-uks-prd-ss-m365-rg"
