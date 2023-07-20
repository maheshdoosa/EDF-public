################ Backup Recovery Services Vault  #############

module "createBackupRecoveryVault" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-recovery-services-vault?ref=v1.1.19"

  name                = "eit-uks-alz-hs-vmbackup-rsv-01" #should be static across environments
  location            = var.lzHubManagementResourceLocation
  resource_group_name = var.backupVaultResourceGroup
  sku                 = "Standard" #should be static across environments
  soft_delete_enabled = "true"     #should be static across environments

}

module "createBackupPolicy01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"

  backupPolicyName              = "Daily-2300-52W-InfraVM" #should be static across environments
  backupPolicyResourceGroupName = var.lzHubManagementResourceLocation
  backupVaultName               = module.createBackupRecoveryVault.name
  backupTimeZone                = "UTC"                                         #should be static across environments
  backupFrequency               = "Daily"                                       #should be static across environments
  backupTime                    = "23:00"                                       #should be static across environments
  retentionDailyCount           = "7"                                           #should be static across environments
  retentionWeeklyCount          = "52"                                          #should be static across environments
  retentionWeeklyDays           = ["Sunday", "Wednesday", "Friday", "Saturday"] #should be static across environments
  retentionMonthlyCount         = "12"                                          #should be static across environments
  retentionMonthlyWeekdays      = ["Sunday", "Wednesday"]                       #should be static across environments
  retentionMonthlyWeeks         = ["First", "Last"]
  retentionYearlyCount          = "1"         #should be static across environments
  retentionYearlyweekdays       = ["Sunday"]  #should be static across environments
  retentionYearlyWeeks          = ["Last"]    #should be static across environments
  retentionYearlyMonths         = ["January"] #should be static across environments

}

module "createBackupPolicy02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"

  backupPolicyName              = "Daily-2200-52W-InfraVM" #should be static across environments
  backupPolicyResourceGroupName = var.lzHubManagementResourceLocation
  backupVaultName               = module.createBackupRecoveryVault.name
  backupTimeZone                = "UTC"                                         #should be static across environments
  backupFrequency               = "Daily"                                       #should be static across environments
  backupTime                    = "22:00"                                       #should be static across environments
  retentionDailyCount           = "7"                                           #should be static across environments
  retentionWeeklyCount          = "52"                                          #should be static across environments
  retentionWeeklyDays           = ["Sunday", "Wednesday", "Friday", "Saturday"] #should be static across environments
  retentionMonthlyCount         = "12"                                          #should be static across environments
  retentionMonthlyWeekdays      = ["Sunday", "Wednesday"]                       #should be static across environments
  retentionMonthlyWeeks         = ["First", "Last"]
  retentionYearlyCount          = "1"         #should be static across environments
  retentionYearlyweekdays       = ["Sunday"]  #should be static across environments
  retentionYearlyWeeks          = ["Last"]    #should be static across environments
  retentionYearlyMonths         = ["January"] #should be static across environments
}
