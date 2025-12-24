data "azurerm_key_vault" "kvi" {
  name                = "vishukey"
  resource_group_name = "vishu-rg"
}
data "azurerm_key_vault_secret" "sql-pass" {
  name         = "sql-pass"
  key_vault_id = data.azurerm_key_vault.kvi.id
}
data "azurerm_key_vault_secret" "sql-user" {
  name         = "sql-user"
  key_vault_id = data.azurerm_key_vault.kvi.id
}