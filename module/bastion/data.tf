data "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "vnet"
  resource_group_name  = "vishnu-rg"
}

data "azurerm_public_ip" "bastion_pip" {
  for_each = var.bastion
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}