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

# module "vm" {
#   depends_on = [module.rg, module.nic, module.pip]
#   source     = "../../module/vm"
#   vm         = var.vm_x

# }
module "vmss" {
  depends_on = [module.rg, module.vnet, module.subnet, module.nic, module.pip]
  source     = "../../module/vmss"
  vmss       = var.vmss_x
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

module "bastion" {
  depends_on = [module.rg, module.vnet, module.subnet, module.pip]
  source     = "../../module/bastion"
  bastion    = var.bastion_x
}

module "nsg" {
  depends_on = [ module.nic, module.vmss ]
  source = "../../module/nsg"
  nsgs = var.nsgs_x
}

module "application_gateway" {
  depends_on = [module.rg, module.vnet, module.subnet, module.pip]
  source     = "../../module/application_gateway"
  application_gateway = var.application_gateway_x
}

