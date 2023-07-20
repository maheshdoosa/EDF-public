environment = "Production"

cenadtKvName            = "avmeitalzhscenadtsub01kv"
cenadtKvRgName          = ".security"
cenadtResourceLocation  = "UK South"
cenadtAgRgName          = "eit-uks-alz-hs-cenadt-loga-rg-01" // LA workspace RG name
cenadtAgName            = "edf_eit_SecurityOps"
short_name              = "SecurityOps" // Action group display name
laworkspaceResourceId   = "laworkspaceResourceId"
authorized_resource_ids = []
linuxdcrName            = "ALZ-SENTINEL-SECLOGS-LINUXEVENT"
windowsdcrName          = "ALZ-SENTINEL-SECLOGS-WINEVENT"

################# Alert rule description ######################
query_description1  = "Alerts if a Public IP has been assigned to a VM"
query_description2  = "Alerts if a VM is not using a Managed Disk"
query_description3  = "Alerts if Azure Anti-Malware Signatures auto update  has been disabled"
query_description4  = "Alerts if an unattached disk is not encrypted"
query_description5  = "Alerts if the MS IaaS Anti-Malware agent is not deployed on a VM"
query_description6  = "Alerts if an UDR has been modified or deleted"
query_description7  = "Alerts if any network security rule allows SSH access from Internet"
query_description8  = "Alerts if any network security rule allows RDP access from Internet"
query_description9  = "Alerts if a Key Vault is not configured to use a virtual network service endpoint"
query_description10 = "Alerts if a Storage Account is not configured to use a virtual network service endpoint"
query_description11 = "Alerts if Subscription Logging profile has been modified or deleted"
query_description12 = "Alerts if the Log retention period has been changed"
query_description13 = "Alerts if anonymous/public access is enabled"
query_description14 = "Alerts if Secure transfer to storage accounts is disabled"
query_description15 = "Alerts if VM Backup is disabled"
query_description16 = "Alert when owner assigned to a subscription"
query_description17 = "Alerts when Purge Protection is not enabled on a Key Vault"
query_description18 = "Alerts when a Key Vault has been deleted"
query_description19 = "Alerts when an Automation account variable is not encrypted"
query_description20 = "Alerts when a High priority event has been detected by Security Center"
query_description21 = "Alerts when a Medium priority event has been detected by Security Center"
query_description22 = "Alerts when a Low priority event has been detected by Security Center"

############### Alert rule name ###################
queryname1  = "HIGH-alz-alert_PublicIPAssigned"
queryname2  = "MEDIUM-alz-alert_ManagedDiskDisabled"
queryname3  = "MEDIUM-alz-alert_AntiMalwareAutoUpdateDisabled"
queryname4  = "MEDIUM-alz-alert-UnattachedDiskUnencrypted"
queryname5  = "MEDIUM-alz-alert-MSIaaSAntiMalwareAgentMissing"
queryname6  = "CRITICAL-alz-alert_UDRModified"
queryname7  = "CRITICAL-alz-alert_SSHAccessFromInternetAllowed"
queryname8  = "CRITICAL-alz-alert_RDPAccessFromInternetAllowed"
queryname9  = "MEDIUM-alz-alert-KeyVaultVNETServiceEndpointDisabled"
queryname10 = "MEDIUM-alz-alert-StorageAccountVNETServiceEndpointDisabled"
queryname11 = "CRITICAL-alz-alert_SubLogModified"
queryname12 = "HIGH-alz-alert_ActivityLogRetentionChanged"
queryname13 = "HIGH-alz-alert_StoragePublicAccessEnabled"
queryname14 = "HIGH-alz-alert_StorageAccTLSDisabled"
queryname15 = "MEDIUM-alz-alert_VMBackupDisabled"
queryname16 = "MEDIUM-alz-alert_SubOwnerAssigned"
queryname17 = "HIGH-alz-alert_KeyVaultPurgeProtectionDisabled"
queryname18 = "CRITICAL-alz-alert_KeyVaultPurged"
queryname19 = "HIGH-alz-alert_AutomationAccVariableUnencrypted"
queryname20 = "HIGH-alz-alert_SecurityCenter"
queryname21 = "MEDIUM-alz-alert_SecurityCenter"
queryname22 = "LOW-alz-alert_SecurityCenter"

emails = [
  {
    name                    = "Security_alerts" // Notification Name
    email_address           = "shahzad.ahmed@avanade.com"
    use_common_alert_schema = true
  }
]

action = [{
  action_group = []

  custom_webhook_payload = null
  email_subject          = ""
}]

trigger = [{
  operator  = ""
  threshold = null
}]

severitytype0 = 0 // Critical
severitytype1 = 1 // Error
severitytype2 = 2 // Warning
severitytype3 = 3 // Informational
severitytype4 = 4 // Verbose

# query                   = null
query_type  = null
throttling  = null
time_window = 30
frequency   = 10
enabled     = true
