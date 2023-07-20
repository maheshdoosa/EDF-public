########### Imported Key vaults to Key vaults 14 were using by AVM which created manually ########

environment          = "High Secured Management"
managementHsKvName   = "eitlzmanagementhskv"
managementHsKvRgName = ".security"

####################### Keyvault

kv_resource_group_name          = ".security"
resource_Location               = "uksouth"
keyvault_name                   = "datastrategydevkv"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false   #need to check
enabled_for_disk_encryption     = "false"    //true or false
enabled_for_template_deployment = "false"    //true or false   #need to check
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //false //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Allow"         // Allow will enable access to all networks
bypass                          = "AzureServices" //none

####################### Keyvault01

kv_resource_group_name01          = ".security"
resource_Location01               = "uksouth"
keyvault_name01                   = "datastrategyprdkv"
sku_name01                        = "standard" // standard or premium HSM
enabled_for_deployment01          = "false"    //true or false   #need to check
enabled_for_disk_encryption01     = "false"    //true or false
enabled_for_template_deployment01 = "false"    //true or false   #need to check
soft_delete_retention_days01      = "90"
purge_protection_enabled01        = "true" //false //true
diagnosticsetting_name01          = "keyVault-diagnostics"
default_action01                  = "Allow"         // Allow will enable access to all networks
bypass01                          = "AzureServices" //none

####################### Keyvault02

kv_resource_group_name02          = ".security"
resource_Location02               = "uksouth"
keyvault_name02                   = "mgmtssinfrasecretsprd"
sku_name02                        = "standard" // standard or premium HSM
enabled_for_deployment02          = "false"    //true or false   #need to check
enabled_for_disk_encryption02     = "false"    //true or false
enabled_for_template_deployment02 = "false"    //true or false   #need to check
soft_delete_retention_days02      = "90"
purge_protection_enabled02        = "true" //false //true
diagnosticsetting_name02          = "keyVault-diagnostics"
default_action02                  = "Allow"         // Allow will enable access to all networks
bypass02                          = "AzureServices" //none

####################### Keyvault03

kv_resource_group_name03          = ".security"
resource_Location03               = "uksouth"
keyvault_name03                   = "genssmanagedprdkv"
sku_name03                        = "standard" // standard or premium HSM
enabled_for_deployment03          = "false"    //true or false   #need to check
enabled_for_disk_encryption03     = "false"    //true or false
enabled_for_template_deployment03 = "false"    //true or false   #need to check
soft_delete_retention_days03      = "90"
purge_protection_enabled03        = "true" //false //true
diagnosticsetting_name03          = "keyVault-diagnostics"
default_action03                  = "Allow"         // Allow will enable access to all networks
bypass03                          = "AzureServices" //none

####################### Keyvault04

kv_resource_group_name04          = ".security"
resource_Location04               = "uksouth"
keyvault_name04                   = "genssmanagedtstkv"
sku_name04                        = "standard" // standard or premium HSM
enabled_for_deployment04          = "false"    //true or false   #need to check
enabled_for_disk_encryption04     = "false"    //true or false
enabled_for_template_deployment04 = "false"    //true or false   #need to check
soft_delete_retention_days04      = "90"
purge_protection_enabled04        = "true" //false //true
diagnosticsetting_name04          = "keyVault-diagnostics"
default_action04                  = "Allow"         // Allow will enable access to all networks
bypass04                          = "AzureServices" //none

####################### Keyvault05

kv_resource_group_name05          = ".security"
resource_Location05               = "uksouth"
keyvault_name05                   = "eithscenadtprdkv"
sku_name05                        = "standard" // standard or premium HSM
enabled_for_deployment05          = "false"    //true or false   #need to check
enabled_for_disk_encryption05     = "false"    //true or false
enabled_for_template_deployment05 = "false"    //true or false   #need to check
soft_delete_retention_days05      = "90"
purge_protection_enabled05        = "true" //false //true
diagnosticsetting_name05          = "keyVault-diagnostics"
default_action05                  = "Allow"         // Allow will enable access to all networks
bypass05                          = "AzureServices" //none

####################### Keyvault06

kv_resource_group_name06          = ".security"
resource_Location06               = "uksouth"
keyvault_name06                   = "gensscitstkv"
sku_name06                        = "standard" // standard or premium HSM
enabled_for_deployment06          = "false"    //true or false   #need to check
enabled_for_disk_encryption06     = "false"    //true or false
enabled_for_template_deployment06 = "false"    //true or false   #need to check
soft_delete_retention_days06      = "90"
purge_protection_enabled06        = "true" //false //true
diagnosticsetting_name06          = "keyVault-diagnostics"
default_action06                  = "Allow"         // Allow will enable access to all networks
bypass06                          = "AzureServices" //none

####################### Keyvault07

kv_resource_group_name07          = ".security"
resource_Location07               = "uksouth"
keyvault_name07                   = "genssciprdkv"
sku_name07                        = "standard" // standard or premium HSM
enabled_for_deployment07          = "false"    //true or false   #need to check
enabled_for_disk_encryption07     = "false"    //true or false
enabled_for_template_deployment07 = "false"    //true or false   #need to check
soft_delete_retention_days07      = "90"
purge_protection_enabled07        = "true" //false //true
diagnosticsetting_name07          = "keyVault-diagnostics"
default_action07                  = "Allow"         // Allow will enable access to all networks
bypass07                          = "AzureServices" //none

####################### Keyvault08

kv_resource_group_name08          = ".security"
resource_Location08               = "uksouth"
keyvault_name08                   = "genhsmanagedtstkv"
sku_name08                        = "standard" // standard or premium HSM
enabled_for_deployment08          = "false"    //true or false   #need to check
enabled_for_disk_encryption08     = "false"    //true or false
enabled_for_template_deployment08 = "false"    //true or false   #need to check
soft_delete_retention_days08      = "90"
purge_protection_enabled08        = "true" //false //true
diagnosticsetting_name08          = "keyVault-diagnostics"
default_action08                  = "Allow"         // Allow will enable access to all networks
bypass08                          = "AzureServices" //none

####################### Keyvault09

kv_resource_group_name09          = ".security"
resource_Location09               = "uksouth"
keyvault_name09                   = "genhsmanagedprdkv"
sku_name09                        = "standard" // standard or premium HSM
enabled_for_deployment09          = "false"    //true or false   #need to check
enabled_for_disk_encryption09     = "false"    //true or false
enabled_for_template_deployment09 = "false"    //true or false   #need to check
soft_delete_retention_days09      = "90"
purge_protection_enabled09        = "true" //false //true
diagnosticsetting_name09          = "keyVault-diagnostics"
default_action09                  = "Allow"         // Allow will enable access to all networks
bypass09                          = "AzureServices" //none

####################### Keyvault10

kv_resource_group_name10          = ".security"
resource_Location10               = "uksouth"
keyvault_name10                   = "eitssmanagedprdkv"
sku_name10                        = "standard" // standard or premium HSM
enabled_for_deployment10          = "false"    //true or false   #need to check
enabled_for_disk_encryption10     = "false"    //true or false
enabled_for_template_deployment10 = "false"    //true or false   #need to check
soft_delete_retention_days10      = "90"
purge_protection_enabled10        = "true" //false //true
diagnosticsetting_name10          = "keyVault-diagnostics"
default_action10                  = "Allow"         // Allow will enable access to all networks
bypass10                          = "AzureServices" //none

####################### Keyvault11

kv_resource_group_name11          = ".security"
resource_Location11               = "uksouth"
keyvault_name11                   = "edfprojectskv"
sku_name11                        = "standard" // standard or premium HSM
enabled_for_deployment11          = "false"    //true or false   #need to check
enabled_for_disk_encryption11     = "false"    //true or false
enabled_for_template_deployment11 = "false"    //true or false   #need to check
soft_delete_retention_days11      = "90"
purge_protection_enabled11        = "true" //false //true
diagnosticsetting_name11          = "keyVault-diagnostics"
default_action11                  = "Allow"         // Allow will enable access to all networks
bypass11                          = "AzureServices" //none

####################### Keyvault12

kv_resource_group_name12          = ".security"
resource_Location12               = "uksouth"
keyvault_name12                   = "eitavmkv"
sku_name12                        = "standard" // standard or premium HSM
enabled_for_deployment12          = "false"    //true or false   #need to check
enabled_for_disk_encryption12     = "false"    //true or false
enabled_for_template_deployment12 = "false"    //true or false   #need to check
soft_delete_retention_days12      = "90"
purge_protection_enabled12        = "true" //false //true
diagnosticsetting_name12          = "keyVault-diagnostics"
default_action12                  = "Allow"         // Allow will enable access to all networks
bypass12                          = "AzureServices" //none

####################### Keyvault13

kv_resource_group_name13          = ".security"
resource_Location13               = "uksouth"
keyvault_name13                   = "eithssecgovprdkv"
sku_name13                        = "standard" // standard or premium HSM
enabled_for_deployment13          = "false"    //true or false   #need to check
enabled_for_disk_encryption13     = "false"    //true or false
enabled_for_template_deployment13 = "false"    //true or false   #need to check
soft_delete_retention_days13      = "90"
purge_protection_enabled13        = "true" //false //true
diagnosticsetting_name13          = "keyVault-diagnostics"
default_action13                  = "Allow"         // Allow will enable access to all networks
bypass13                          = "AzureServices" //none

####################### Keyvault14

kv_resource_group_name14          = ".security"
resource_Location14               = "uksouth"
keyvault_name14                   = "eitsssecgovprdkv"
sku_name14                        = "standard" // standard or premium HSM
enabled_for_deployment14          = "false"    //true or false   #need to check
enabled_for_disk_encryption14     = "false"    //true or false
enabled_for_template_deployment14 = "false"    //true or false   #need to check
soft_delete_retention_days14      = "90"
purge_protection_enabled14        = "true" //false //true
diagnosticsetting_name14          = "keyVault-diagnostics"
default_action14                  = "Allow"         // Allow will enable access to all networks
bypass14                          = "AzureServices" //none

####################### Keyvault15

keyvault_name15                   = "eit-uks-alz-hs-cred-kv"
resource_Location15               = "uk south"
kv_resource_group_name15          = "eit-uks-alz-hs-cred-rg-01"
sku_name15                        = "standard" // standard or premium HSM
enabled_for_deployment15          = "true"     //true or false
enabled_for_disk_encryption15     = "false"    //true or false
enabled_for_template_deployment15 = "false"    //true or false
soft_delete_retention_days15      = "90"
purge_protection_enabled15        = "true" //true
diagnosticsetting_name15          = "keyVault-diagnostics"
default_action15                  = "Allow"         //Allow will enable access to all networks
bypass15                          = "AzureServices" //none
aad_user15_01                     = "d5d939fc-7a73-46a0-abf6-b41d95a7b286"
aad_user15_02                     = "ff255ba1-e24d-457e-812c-a09d030e22a8"

####################### Keyvault16

keyvault_name16                   = "eitlzmanagementhskv"
resource_Location16               = "uk south"
kv_resource_group_name16          = ".security"
sku_name16                        = "standard" // standard or premium HSM
enabled_for_deployment16          = "true"     //true or false
enabled_for_disk_encryption16     = "false"    //true or false
enabled_for_template_deployment16 = "false"    //true or false
soft_delete_retention_days16      = "90"
purge_protection_enabled16        = "true" //true
diagnosticsetting_name16          = "keyVault-diagnostics"
default_action16                  = "Allow"         //Allow will enable access to all networks
bypass16                          = "AzureServices" //none

####################### Keyvault17

keyvault_name17                   = "eit-uks-alz-hs-ade-kvt"
resource_Location17               = "uk south"
kv_resource_group_name17          = "eit-uks-alz-hs-ade-rg-01"
sku_name17                        = "standard" // standard or premium HSM
enabled_for_deployment17          = "true"     //true or false
enabled_for_disk_encryption17     = "false"    //true or false
enabled_for_template_deployment17 = "false"    //true or false
soft_delete_retention_days17      = "90"
purge_protection_enabled17        = "true" //true
diagnosticsetting_name17          = "keyVault-diagnostics"
default_action17                  = "Allow"         //Allow will enable access to all networks
bypass17                          = "AzureServices" //none

####################### Keyvault18

keyvault_name18                   = "eit-uks-hs-ntc-kvt-01"
resource_Location18               = "uk south"
kv_resource_group_name18          = "eit-uks-alz-hs-ntc-rg"
sku_name18                        = "standard" // standard or premium HSM
enabled_for_deployment18          = "true"     //true or false
enabled_for_disk_encryption18     = "false"    //true or false
enabled_for_template_deployment18 = "false"    //true or false
soft_delete_retention_days18      = "90"
purge_protection_enabled18        = "true" //true
diagnosticsetting_name18          = "keyVault-diagnostics"
default_action18                  = "Allow"         //Allow will enable access to all networks
bypass18                          = "AzureServices" //none

####################### Keyvault19

keyvault_name19                   = "eit-uks-alz-hs-ad-kvt-01"
resource_Location19               = "uk south"
kv_resource_group_name19          = "eit-uks-alz-hs-vmbackup-rg"
sku_name19                        = "standard" // standard or premium HSM
enabled_for_deployment19          = "true"     //true or false
enabled_for_disk_encryption19     = "false"    //true or false
enabled_for_template_deployment19 = "false"    //true or false
soft_delete_retention_days19      = "90"
purge_protection_enabled19        = "true" //true
diagnosticsetting_name19          = "keyVault-diagnostics"
default_action19                  = "Allow"         //Allow will enable access to all networks
bypass19                          = "AzureServices" //none

############### Diagnostic Setting Configuration #############################################

diagsettingakv = ["datastrategydevkv",
  "datastrategyprdkv",
  "mgmtssinfrasecretsprd",
  "genssmanagedprdkv",
  "genssmanagedtstkv",
  "eithscenadtprdkv",
  "gensscitstkv",
  "genssciprdkv",
  "genhsmanagedtstkv",
  "genhsmanagedprdkv",
  "eitssmanagedprdkv",
  "edfprojectskv",
  "eitavmkv",
  "eithssecgovprdkv",
  "eitsssecgovprdkv",
"eitlzmanagementhskv"]

diagsettingakv15 = ["eit-uks-alz-hs-cred-kv"]
diagsettingakv17 = ["eit-uks-alz-hs-ade-kvt"]
diagsettingakv18 = ["eit-uks-hs-ntc-kvt-01"]
diagsettingakv19 = ["eit-uks-alz-hs-ad-kvt-01"]
