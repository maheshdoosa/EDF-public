########### Import Key vaults to Key vaults 14 were using by AVM which created manually########

module "createTargetRgForKV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.kv_resource_group_name
  resourceLocation  = var.resource_Location
  additionalTags    = module.KVTags.tagsResult
}

module "createkeyvault" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name
  resource_Location               = var.resource_Location
  resource_group_name             = var.kv_resource_group_name
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  # diagnosticsetting_name          = var.diagnosticsetting_name
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action
  bypass         = var.bypass
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault01" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name01
  resource_Location               = var.resource_Location01
  resource_group_name             = var.kv_resource_group_name01
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name01
  enabled_for_deployment          = var.enabled_for_deployment01
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption01
  enabled_for_template_deployment = var.enabled_for_template_deployment01
  soft_delete_retention_days      = var.soft_delete_retention_days01
  purge_protection_enabled        = var.purge_protection_enabled01
  # diagnosticsetting_name          = var.diagnosticsetting_name01
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action01
  bypass         = var.bypass01
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault02" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name02
  resource_Location               = var.resource_Location02
  resource_group_name             = var.kv_resource_group_name02
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name02
  enabled_for_deployment          = var.enabled_for_deployment02
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption02
  enabled_for_template_deployment = var.enabled_for_template_deployment02
  soft_delete_retention_days      = var.soft_delete_retention_days02
  purge_protection_enabled        = var.purge_protection_enabled02
  # diagnosticsetting_name          = var.diagnosticsetting_name02
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action02
  bypass         = var.bypass02
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault03" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name03
  resource_Location               = var.resource_Location03
  resource_group_name             = var.kv_resource_group_name03
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name03
  enabled_for_deployment          = var.enabled_for_deployment03
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption03
  enabled_for_template_deployment = var.enabled_for_template_deployment03
  soft_delete_retention_days      = var.soft_delete_retention_days03
  purge_protection_enabled        = var.purge_protection_enabled03
  # diagnosticsetting_name          = var.diagnosticsetting_name03
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action03
  bypass         = var.bypass03
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault04" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name04
  resource_Location               = var.resource_Location04
  resource_group_name             = var.kv_resource_group_name04
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name04
  enabled_for_deployment          = var.enabled_for_deployment04
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption04
  enabled_for_template_deployment = var.enabled_for_template_deployment04
  soft_delete_retention_days      = var.soft_delete_retention_days04
  purge_protection_enabled        = var.purge_protection_enabled04
  # diagnosticsetting_name          = var.diagnosticsetting_name04
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action04
  bypass         = var.bypass04
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault05" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name05
  resource_Location               = var.resource_Location05
  resource_group_name             = var.kv_resource_group_name05
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name05
  enabled_for_deployment          = var.enabled_for_deployment05
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption05
  enabled_for_template_deployment = var.enabled_for_template_deployment05
  soft_delete_retention_days      = var.soft_delete_retention_days05
  purge_protection_enabled        = var.purge_protection_enabled05
  # diagnosticsetting_name          = var.diagnosticsetting_name05
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action05
  bypass         = var.bypass05
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault06" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name06
  resource_Location               = var.resource_Location06
  resource_group_name             = var.kv_resource_group_name06
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name06
  enabled_for_deployment          = var.enabled_for_deployment06
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption06
  enabled_for_template_deployment = var.enabled_for_template_deployment06
  soft_delete_retention_days      = var.soft_delete_retention_days06
  purge_protection_enabled        = var.purge_protection_enabled06
  # diagnosticsetting_name          = var.diagnosticsetting_name06
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action06
  bypass         = var.bypass06
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault07" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name07
  resource_Location               = var.resource_Location07
  resource_group_name             = var.kv_resource_group_name07
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name07
  enabled_for_deployment          = var.enabled_for_deployment07
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption07
  enabled_for_template_deployment = var.enabled_for_template_deployment07
  soft_delete_retention_days      = var.soft_delete_retention_days07
  purge_protection_enabled        = var.purge_protection_enabled07
  # diagnosticsetting_name          = var.diagnosticsetting_name07
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action07
  bypass         = var.bypass07
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault08" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name08
  resource_Location               = var.resource_Location08
  resource_group_name             = var.kv_resource_group_name08
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name08
  enabled_for_deployment          = var.enabled_for_deployment08
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption08
  enabled_for_template_deployment = var.enabled_for_template_deployment08
  soft_delete_retention_days      = var.soft_delete_retention_days08
  purge_protection_enabled        = var.purge_protection_enabled08
  # diagnosticsetting_name          = var.diagnosticsetting_name08
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action08
  bypass         = var.bypass08
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault09" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name09
  resource_Location               = var.resource_Location09
  resource_group_name             = var.kv_resource_group_name09
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name09
  enabled_for_deployment          = var.enabled_for_deployment09
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption09
  enabled_for_template_deployment = var.enabled_for_template_deployment09
  soft_delete_retention_days      = var.soft_delete_retention_days09
  purge_protection_enabled        = var.purge_protection_enabled09
  # diagnosticsetting_name          = var.diagnosticsetting_name09
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action09
  bypass         = var.bypass09
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault10" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name10
  resource_Location               = var.resource_Location10
  resource_group_name             = var.kv_resource_group_name10
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name10
  enabled_for_deployment          = var.enabled_for_deployment10
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption10
  enabled_for_template_deployment = var.enabled_for_template_deployment10
  soft_delete_retention_days      = var.soft_delete_retention_days10
  purge_protection_enabled        = var.purge_protection_enabled10
  # diagnosticsetting_name          = var.diagnosticsetting_name10
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action10
  bypass         = var.bypass10
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault11" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name11
  resource_Location               = var.resource_Location11
  resource_group_name             = var.kv_resource_group_name11
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name11
  enabled_for_deployment          = var.enabled_for_deployment11
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption11
  enabled_for_template_deployment = var.enabled_for_template_deployment11
  soft_delete_retention_days      = var.soft_delete_retention_days11
  purge_protection_enabled        = var.purge_protection_enabled11
  # diagnosticsetting_name          = var.diagnosticsetting_name11
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action11
  bypass         = var.bypass11
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault12" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name12
  resource_Location               = var.resource_Location12
  resource_group_name             = var.kv_resource_group_name12
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name12
  enabled_for_deployment          = var.enabled_for_deployment12
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption12
  enabled_for_template_deployment = var.enabled_for_template_deployment12
  soft_delete_retention_days      = var.soft_delete_retention_days12
  purge_protection_enabled        = var.purge_protection_enabled12
  # diagnosticsetting_name          = var.diagnosticsetting_name12
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action12
  bypass         = var.bypass12
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault13" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name13
  resource_Location               = var.resource_Location13
  resource_group_name             = var.kv_resource_group_name13
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name13
  enabled_for_deployment          = var.enabled_for_deployment13
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption13
  enabled_for_template_deployment = var.enabled_for_template_deployment13
  soft_delete_retention_days      = var.soft_delete_retention_days13
  purge_protection_enabled        = var.purge_protection_enabled13
  # diagnosticsetting_name          = var.diagnosticsetting_name13
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action13
  bypass         = var.bypass13
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createkeyvault14" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name14
  resource_Location               = var.resource_Location14
  resource_group_name             = var.kv_resource_group_name14
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name14
  enabled_for_deployment          = var.enabled_for_deployment14
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption14
  enabled_for_template_deployment = var.enabled_for_template_deployment14
  soft_delete_retention_days      = var.soft_delete_retention_days14
  purge_protection_enabled        = var.purge_protection_enabled14
  # diagnosticsetting_name          = var.diagnosticsetting_name14
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action14
  bypass         = var.bypass14
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

#### cred for Steve and Wayne

module "createTargetRgForKV15" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.kv_resource_group_name15
  resourceLocation  = var.resource_Location15
  additionalTags    = module.KVTags.tagsResult
}

module "createkeyvault15" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name15
  resource_Location               = var.resource_Location15
  resource_group_name             = var.kv_resource_group_name15
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name15
  enabled_for_deployment          = var.enabled_for_deployment15
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption15
  enabled_for_template_deployment = var.enabled_for_template_deployment15
  soft_delete_retention_days      = var.soft_delete_retention_days15
  purge_protection_enabled        = var.purge_protection_enabled15
  # diagnosticsetting_name          = var.diagnosticsetting_name15
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action  = var.default_action15
  bypass          = var.bypass15
  additionalTags  = module.KVTags.tagsResult
  access_policies = local.access_policies
  depends_on      = [module.createTargetRgForKV15]
}

module "createkeyvault16" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name16
  resource_Location               = var.resource_Location16
  resource_group_name             = var.kv_resource_group_name16
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name16
  enabled_for_deployment          = var.enabled_for_deployment16
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption16
  enabled_for_template_deployment = var.enabled_for_template_deployment16
  soft_delete_retention_days      = var.soft_delete_retention_days16
  purge_protection_enabled        = var.purge_protection_enabled16
  # diagnosticsetting_name          = var.diagnosticsetting_name16
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action16
  bypass         = var.bypass16
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createTargetRgForKV17" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.kv_resource_group_name17
  resourceLocation  = var.resource_Location17
  additionalTags    = module.KVTags.tagsResult
}

module "createkeyvault17" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name17
  resource_Location               = var.resource_Location17
  resource_group_name             = var.kv_resource_group_name17
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name17
  enabled_for_deployment          = var.enabled_for_deployment17
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption17
  enabled_for_template_deployment = var.enabled_for_template_deployment17
  soft_delete_retention_days      = var.soft_delete_retention_days17
  purge_protection_enabled        = var.purge_protection_enabled17
  # diagnosticsetting_name          = var.diagnosticsetting_name17
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action17
  bypass         = var.bypass17
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

module "createTargetRgForKV18" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.kv_resource_group_name18
  resourceLocation  = var.resource_Location18
  additionalTags    = module.KVTags.tagsResult
}

module "createkeyvault18" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name18
  resource_Location               = var.resource_Location18
  resource_group_name             = var.kv_resource_group_name18
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name18
  enabled_for_deployment          = var.enabled_for_deployment18
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption18
  enabled_for_template_deployment = var.enabled_for_template_deployment18
  soft_delete_retention_days      = var.soft_delete_retention_days18
  purge_protection_enabled        = var.purge_protection_enabled18
  # diagnosticsetting_name          = var.diagnosticsetting_name18
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action18
  bypass         = var.bypass18
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}


module "createTargetRgForKV19" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.kv_resource_group_name19
  resourceLocation  = var.resource_Location19
  additionalTags    = module.KVTags.tagsResult
}

module "createkeyvault19" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name19
  resource_Location               = var.resource_Location19
  resource_group_name             = var.kv_resource_group_name19
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name19
  enabled_for_deployment          = var.enabled_for_deployment19
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption19
  enabled_for_template_deployment = var.enabled_for_template_deployment19
  soft_delete_retention_days      = var.soft_delete_retention_days19
  purge_protection_enabled        = var.purge_protection_enabled19
  # diagnosticsetting_name          = var.diagnosticsetting_name19
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action19
  bypass         = var.bypass19
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV]
}

################# diagnostic log configuration #######################################

module "diagsettings-hslaw" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id
  resource_id                = each.key
  diag_settings_name         = "akv-hs-law"
  log_analytics_workspace_id = local.diag_settings["akv-hs-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings["akv-hs-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings["akv-hs-law"]["diagnostic_metrics"]
}

module "diagsettings-centlaw" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id
  resource_id                = each.key
  diag_settings_name         = "akv-cent-law"
  log_analytics_workspace_id = local.diag_settings["akv-cent-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings["akv-cent-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings["akv-cent-law"]["diagnostic_metrics"]
}

module "diagsettings-hslaw-15" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_15
  resource_id                = each.key
  diag_settings_name         = "akv-hs-law"
  log_analytics_workspace_id = local.diag_settings15["akv-hs-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings15["akv-hs-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings15["akv-hs-law"]["diagnostic_metrics"]
}

module "diagsettings-centlaw-15" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_15
  resource_id                = each.key
  diag_settings_name         = "akv-cent-law"
  log_analytics_workspace_id = local.diag_settings15["akv-cent-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings15["akv-cent-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings15["akv-cent-law"]["diagnostic_metrics"]
}

module "diagsettings-hslaw-17" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_17
  resource_id                = each.key
  diag_settings_name         = "akv-hs-law"
  log_analytics_workspace_id = local.diag_settings17["akv-hs-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings17["akv-hs-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings17["akv-hs-law"]["diagnostic_metrics"]
}

module "diagsettings-centlaw-17" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_17
  resource_id                = each.key
  diag_settings_name         = "akv-cent-law"
  log_analytics_workspace_id = local.diag_settings17["akv-cent-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings17["akv-cent-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings17["akv-cent-law"]["diagnostic_metrics"]
}

module "diagsettings-hslaw-18" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_18
  resource_id                = each.key
  diag_settings_name         = "akv-hs-law"
  log_analytics_workspace_id = local.diag_settings18["akv-hs-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings18["akv-hs-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings18["akv-hs-law"]["diagnostic_metrics"]
}

module "diagsettings-centlaw-18" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_18
  resource_id                = each.key
  diag_settings_name         = "akv-cent-law"
  log_analytics_workspace_id = local.diag_settings18["akv-cent-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings18["akv-cent-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings18["akv-cent-law"]["diagnostic_metrics"]
}

module "diagsettings-hslaw-19" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_19
  resource_id                = each.key
  diag_settings_name         = "akv-hs-law"
  log_analytics_workspace_id = local.diag_settings19["akv-hs-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings19["akv-hs-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings19["akv-hs-law"]["diagnostic_metrics"]
}

module "diagsettings-centlaw-19" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.kv_id_19
  resource_id                = each.key
  diag_settings_name         = "akv-cent-law"
  log_analytics_workspace_id = local.diag_settings19["akv-cent-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings19["akv-cent-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings19["akv-cent-law"]["diagnostic_metrics"]
}
