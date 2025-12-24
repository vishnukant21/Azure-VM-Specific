resource "azurerm_mssql_server" "mssql" {
  for_each = var.mssql_server

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.sql-user.value
  administrator_login_password = data.azurerm_key_vault_secret.sql-pass.value
  minimum_tls_version          = each.value.minimum_tls_version
}