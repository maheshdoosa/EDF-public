module "az-action-group" {
  source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-action-group?ref=v1.1.19"
  name                = var.cenadtAgName
  resource_group_name = var.cenadtAgRgName
  location            = var.cenadtResourceLocation
  short_name          = var.short_name
  emails              = var.emails
  additionalTags      = module.actionGroupTags.tagsResult
}

module "scheduledQuery1" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description1
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname1
  query                   = local.query1
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype1
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery2" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description2
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname2
  query                   = local.query2
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery3" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description3
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname3
  query                   = local.query3
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery4" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description4
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname4
  query                   = local.query4
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery5" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description5
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname5
  query                   = local.query5
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery6" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description6
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname6
  query                   = local.query6
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype0
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery7" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description7
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname7
  query                   = local.query7
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype0
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery8" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description8
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname8
  query                   = local.query8
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype0
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery9" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description9
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname9
  query                   = local.query9
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery10" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description10
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname10
  query                   = local.query10
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery11" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description11
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname11
  query                   = local.query11
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype0
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery12" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description12
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname12
  query                   = local.query12
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype1
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery13" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description13
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname13
  query                   = local.query13
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype1
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery14" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description14
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname14
  query                   = local.query14
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype1
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery15" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description15
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname15
  query                   = local.query15
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery16" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description16
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname16
  query                   = local.query16
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype2
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery17" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description17
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname17
  query                   = local.query17
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype1
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery18" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description18
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname18
  query                   = local.query18
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype0
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

module "scheduledQuery19" {
  source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query?ref=v1.1.19"
  authorized_resource_ids = var.authorized_resource_ids
  data_source_id          = local.data_source_id
  description             = var.query_description19
  enabled                 = var.enabled
  frequency               = var.frequency
  location                = var.cenadtResourceLocation
  name                    = var.queryname19
  query                   = local.query19
  query_type              = var.query_type
  resource_group_name     = var.cenadtAgRgName
  severity                = var.severitytype1
  additionalTags          = module.scheduledQueryTags.tagsResult
  throttling              = var.throttling
  time_window             = var.time_window
  action                  = local.action
  timeouts                = local.timeouts
  trigger                 = local.trigger

  depends_on = [module.az-action-group]
}

# module "scheduledQuery20" {
#   source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query"
#   authorized_resource_ids = var.authorized_resource_ids
#   data_source_id          = local.data_source_id
#   description             = var.query_description20
#   enabled                 = var.enabled
#   frequency               = var.frequency
#   location                = var.cenadtResourceLocation
#   name                    = var.queryname20
#   query                   = local.query20
#   query_type              = var.query_type
#   resource_group_name     = var.cenadtAgRgName
#   severity                = var.severitytype1
#   additionalTags          = module.scheduledQueryTags.tagsResult
#   throttling              = var.throttling
#   time_window             = var.time_window
#   action                  = local.action
#   timeouts                = local.timeouts
#   trigger                 = local.trigger

#   depends_on              = [module.az-action-group]
# }

# module "scheduledQuery21" {
#   source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query"
#   authorized_resource_ids = var.authorized_resource_ids
#   data_source_id          = local.data_source_id
#   description             = var.query_description21
#   enabled                 = var.enabled
#   frequency               = var.frequency
#   location                = var.cenadtResourceLocation
#   name                    = var.queryname21
#   query                   = local.query21
#   query_type              = var.query_type
#   resource_group_name     = var.cenadtAgRgName
#   severity                = var.severitytype2
#   additionalTags          = module.scheduledQueryTags.tagsResult
#   throttling              = var.throttling
#   time_window             = var.time_window
#   action                  = local.action
#   timeouts                = local.timeouts
#   trigger                 = local.trigger

#   depends_on              = [module.az-action-group]
# }

# module "scheduledQuery22" {
#   source                  = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-monitor-scheduled-query"
#   authorized_resource_ids = var.authorized_resource_ids
#   data_source_id          = local.data_source_id
#   description             = var.query_description22
#   enabled                 = var.enabled
#   frequency               = var.frequency
#   location                = var.cenadtResourceLocation
#   name                    = var.queryname22
#   query                   = local.query22
#   query_type              = var.query_type
#   resource_group_name     = var.cenadtAgRgName
#   severity                = var.severitytype3
#   additionalTags          = module.scheduledQueryTags.tagsResult
#   throttling              = var.throttling
#   time_window             = var.time_window
#   action                  = local.action
#   timeouts                = local.timeouts
#   trigger                 = local.trigger

#   depends_on              = [module.az-action-group]
# }

resource "azurerm_template_deployment" "terraform-arm-linux" {
  name                = var.linuxdcrName
  resource_group_name = var.cenadtAgRgName

  template_body = <<DEPLOY

  {
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
      "dcrName": {
        "type": "string",
        "minLength": 1,
        "metadata": {
          "description": "Name of the data collection rule"
        }
      },
      "location":
      {
        "type": "string",
        "defaultValue": "[resourceGroup().location]",
        "metadata": {
            "description": "Location for data collection rule"
        }
      },
      "workspaceResourceId":
      {
        "type": "string",
        "minLength": 1,
        "metadata": {
          "description": "Full Resource ID of the log analitycs workspace that will be used for data destination. For example /subscriptions/00000000-0000-0000-0000-0000-00000000/resourceGroups/ResourceGroupName/providers/Microsoft.operationalinsights/workspaces/ws_xyz"
        }
      }
    },
    "resources": [
      {
              "type": "Microsoft.Insights/dataCollectionRules",
              "apiVersion": "2019-11-01-preview",
              "name": "[parameters('dcrName')]",
              "location": "[parameters('location')]",
              "kind": "Linux",
              "properties": {
                  "dataSources": {
                      "syslog": [
                          {
                              "streams": [
                                  "Microsoft-Syslog"
                              ],
                              "facilityNames": [
                                  "auth",
                                  "authpriv",
                                  "cron",
                                  "daemon",
                                  "mark",
                                  "kern",
                                  "local0",
                                  "local1",
                                  "local2",
                                  "local3",
                                  "local4",
                                  "local5",
                                  "local6",
                                  "local7",
                                  "lpr",
                                  "mail",
                                  "news",
                                  "syslog",
                                  "user",
                                  "UUCP"
                              ],
                              "logLevels": [
                                  "Info",
                                  "Notice",
                                  "Warning",
                                  "Error",
                                  "Critical",
                                  "Alert",
                                  "Emergency"
                              ],
                              "name": "sysLogsDataSource"
                          }
                      ]
                  },
                  "destinations": {
                      "logAnalytics": [
                          {
                              "workspaceResourceId": "[parameters('workspaceResourceId')]",
                              "name": "la-data-destination"
                          }
                      ]
                  },
                  "dataFlows": [
                      {
                          "streams": [
                              "Microsoft-Syslog"
                          ],
                          "destinations": [
                              "la-data-destination"
                          ]
                      }
                  ]
              }
          }

    ]

 }
 DEPLOY


  parameters = {
    dcrName             = var.linuxdcrName
    location            = var.cenadtResourceLocation
    workspaceResourceId = data.azurerm_key_vault_secret.laworkspaceId.value
  }

  deployment_mode = "Incremental"
}

resource "azurerm_template_deployment" "terraform-arm-windows" {
  name                = var.windowsdcrName
  resource_group_name = var.cenadtAgRgName

  template_body = <<DEPLOY
  {
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "dcrName": {
      "type": "string",
      "minLength": 1,
      "metadata": {
        "description": "Name of the data collection rule"
      }
    },
    "location": {
      "type": "string",
      "defaultValue": "[resourceGroup().location]",
      "metadata": {
        "description": "Location for data collection rule"
      }
    },
    "workspaceResourceId": {
      "type": "string",
      "minLength": 1,
      "metadata": {
        "description": "Full Resource ID of the log analitycs workspace that will be used for data destination. For example /subscriptions/00000000-0000-0000-0000-0000-00000000/resourceGroups/ResourceGroupName/providers/Microsoft.operationalinsights/workspaces/ws_xyz"
      }
    }
  },
  "resources": [
    {
      "type": "Microsoft.Insights/dataCollectionRules",
      "apiVersion": "2019-11-01-preview",
      "name": "[parameters('dcrName')]",
      "location": "[parameters('location')]",
      "kind": "Windows",
      "properties": {
        "dataSources": {
          "windowsEventLogs": [
            {
              "streams": [
                "Microsoft-WindowsEvent"
              ],
              "xPathQueries": [ "Application!*[System[(Level = 3 or Level = 4)]]", "System![System[(Level = 3 or Level = 4 )]]","Security!*[System[(band(Keywords,13510798882111488))]]"],
              "name": "WinEventLogsDataSource"
            }
          ]
        },
        "destinations": {
          "logAnalytics": [
            {
              "workspaceResourceId": "[parameters('workspaceResourceId')]",
              "name": "la-data-destination"
            }
          ]
        },
        "dataFlows": [
          {
            "streams": [
              "Microsoft-Perf",
              "Microsoft-Syslog",
              "Microsoft-Event"
            ],
            "destinations": [
              "la-data-destination"
            ]
          }
        ]
      }
    }
  ]
}
DEPLOY

  parameters = {
    dcrName             = var.windowsdcrName
    location            = var.cenadtResourceLocation
    workspaceResourceId = data.azurerm_key_vault_secret.laworkspaceId.value

  }

  deployment_mode = "Incremental"
}
