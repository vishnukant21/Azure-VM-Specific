module "rg" {
  source = "../../module/resource_group"
  rg     = var.rg_x

}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/vnet"
  vnet       = var.vnet_x
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../module/subnet"
  subnet     = var.subnet_x

}

module "pip" {
  depends_on = [module.rg]
  source     = "../../module/pip"
  pip        = var.pip_x

}
module "nic" {
  depends_on = [module.rg, module.subnet]
  source     = "../../module/nic"
  nic        = var.nic_x   
}

module "vm" {
  depends_on = [module.rg, module.nic, module.pip]
  source     = "../../module/vm"
  vm         = var.vm_x

}

module "mssql" {
  depends_on   = [module.rg, ]
  source       = "../../module/sql_server"
  mssql_server = var.mssql_x
}

module "database" {
  depends_on = [module.mssql]
  source     = "../../module/database"
  databases  = var.databases_x
}
