data "azurerm_network_interface" "nic" {
  for_each = var.vm
  name = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kvi" {
  name                = "vishukey"
  resource_group_name = "vishu-rg"
}

data "azurerm_key_vault_secret" "vm-pass" {
  name         = "vm-pass"
  key_vault_id = data.azurerm_key_vault.kvi.id
}
data "azurerm_key_vault_secret" "vm-user" {
  name         = "vm-user"
  key_vault_id = data.azurerm_key_vault.kvi.id
}
