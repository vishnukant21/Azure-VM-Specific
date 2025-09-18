resource "azurerm_resource_group" "rg-set" {
    for_each = var.rg
    name     = each.value.name
    location = each.value.location
}