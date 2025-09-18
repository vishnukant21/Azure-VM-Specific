data "azurerm_network_interface" "nic" {
  name = "frontend-nic"
  resource_group_name = "vishnu-rg"
}