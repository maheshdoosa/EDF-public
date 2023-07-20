locals {
  f5Vm1primaryIpAddress = data.azurerm_key_vault_secret.f5Vm1primaryIpAddress.value
  f5Vm1mgmtIpAddress    = data.azurerm_key_vault_secret.f5Vm1mgmtIpAddress.value

  f5Vm2secondIpAddress = data.azurerm_key_vault_secret.f5Vm2secondIpAddress.value
  f5Vm2mgmtIpAddress   = data.azurerm_key_vault_secret.f5Vm2mgmtIpAddress.value

  LbPrivateIpAddress = data.azurerm_key_vault_secret.LbPrivateIpAddress.value

  nic_fetch = { for nic in var.diagsettingnic : nic.nicname => nic.rg }
  _nic_id   = [for nic in data.azurerm_network_interface.nicid : nic.id]
  nic_id    = { for id in local._nic_id : id => id }
  diag_settings_nic = {
    Diag-Setting-Mgmt-HS-law = {
      resource_ids     = local.nic_id
      law_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
      diagnostic_log   = []
      diagnostic_metrics = [
        {
          category = "AllMetrics"
          enabled  = true
          retention_policy = {
            enabled = true
            days    = 90
          }
      }]
    }
  }
}
