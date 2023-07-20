data "azurerm_client_config" "current" {
}

data "azurerm_policy_definition" "allowedLocationPolicy" {
  display_name = "Allowed locations"
}
