data "azurerm_mssql_server" "mssql" {
  name                = "vishnu-sqlserver"
  resource_group_name = "vishnu-rg"

}


resource "azurerm_mssql_database" "sqldatabase" {
  for_each     = var.databases
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.mssql.id
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  max_size_gb  = each.value.max_size_gb

}
