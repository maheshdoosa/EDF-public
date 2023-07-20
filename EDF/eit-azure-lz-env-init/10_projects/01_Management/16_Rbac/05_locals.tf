locals {
  _hssub              = data.azurerm_subscriptions.HSsubscriptions.subscriptions[*].id
  roleassignmentscope = { for scope in local._hssub : scope => scope }
}
