locals {
  subId = data.azurerm_key_vault_secret.subscriptionId.value
  ################## Access Policies for Azure AD group and Azure AD ###########
  access_policies = {

    mycustom01 = {

      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azurerm_client_config.current.object_id
      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      certificate_permissions = ["create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "setissuers", "update", "backup", "restore"]
      storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]
    },
    #     mycustom02 = {
    #
    #      tenant_id               = data.azurerm_key_vault_secret.tenantId.value
    #      object_id               = data.azuread_group.adgroup.object_id
    #      key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
    #      secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
    #      certificate_permissions = []
    #      storage_permissions     = []
    #  }
    mycustom03 = {

      tenant_id               = data.azurerm_key_vault_secret.tenantId.value
      object_id               = data.azuread_user.aduser.object_id
      key_permissions         = ["get", "list"]
      secret_permissions      = ["get", "list"]
      certificate_permissions = ["get", "list"]
      storage_permissions     = []
    },
    mycustom04 = {

      tenant_id               = data.azurerm_key_vault_secret.tenantId.value
      object_id               = data.azuread_user.aduser1.object_id
      key_permissions         = ["get", "list"]
      secret_permissions      = ["get", "list"]
      certificate_permissions = ["get", "list"]
      storage_permissions     = []
    }

  }

}
