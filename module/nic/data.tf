data "azurerm_subnet" "subnets-frontend" {
    name = "frontend-subnet"
    resource_group_name = "vishnu-rg"
    virtual_network_name = "vnet"
}
data "azurerm_subnet" "subnets-backend" {
    name = "backend-subnet"
    resource_group_name = "vishnu-rg"
    virtual_network_name = "vnet"
}