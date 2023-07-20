#####################################################################

customrole01_name        = "test_customrole_sandpit_VM_contributor"
customrole01_description = "VM Manage role"
customrole01_actions = ["Microsoft.Compute/availabilitySets/*",
  "Microsoft.Compute/locations/*",
  "Microsoft.Compute/virtualMachines/*",
  "Microsoft.Compute/virtualMachineScaleSets/*",
  "Microsoft.Compute/disks/write",
  "Microsoft.Compute/disks/read",
"Microsoft.Compute/disks/delete", ]
customrole01_not_actions = ["Microsoft.Storage/storageAccounts/listKeys/action",
  "Microsoft.Storage/storageAccounts/read",
"Microsoft.Support/*", ]
customrole01_data_actions     = []
customrole01_not_data_actions = []

customrole02_name        = "test_customrole_sandpit_Storage_contributor"
customrole02_description = "Storage Manage role"
customrole02_actions = [
  "Microsoft.Storage/storageAccounts/listKeys/action",
  "Microsoft.Storage/storageAccounts/read",
"Microsoft.Support/*"]
customrole02_not_actions = [
  "Microsoft.Compute/availabilitySets/*",
  "Microsoft.Compute/locations/*",
  "Microsoft.Compute/virtualMachines/*",
  "Microsoft.Compute/virtualMachineScaleSets/*",
  "Microsoft.Compute/disks/write",
  "Microsoft.Compute/disks/read",
"Microsoft.Compute/disks/delete", ]
customrole02_data_actions     = []
customrole02_not_data_actions = []

ad_group_01_name        = "test_ad_group01_sandpit_for_customrole"
ad_group_01_description = "test adgroup sandpit for customrole"
ad_group_01_owners = ["86c83ffe-7ffb-4961-8d53-f7ef002bd14f",
"2a04ea76-9a8b-47f9-9e95-380a7e3d550d"]
ad_group_01_members = []

ad_group_02_name        = "test_ad_group02_sandpit_for_customrole"
ad_group_02_description = "test adgroup sandpit for customrole"
ad_group_02_owners      = ["86c83ffe-7ffb-4961-8d53-f7ef002bd14f"]
ad_group_02_members     = []

roleassignmetscope01 = "pkitestss"
roleassignmetscope02 = "RHELVMTest2"
