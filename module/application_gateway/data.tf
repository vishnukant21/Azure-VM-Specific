data "azurerm_subnet" "appgw_subnet" {
  name                 = "appgw-subnet"
  virtual_network_name = "vnet"
  resource_group_name  = "vishnu-rg"
}

data "azurerm_public_ip" "appgw_pip" {
  name                = "backend-pip"
  resource_group_name = "vishnu-rg"
}
