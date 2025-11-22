module "rg" {
    source = "../child/resource_group"
    rg   = var.rg_x
  
}

module "vnet" {
    depends_on = [ module.rg ]
    source = "../child/vnet"
    vnet   = var.vnet_x
}

module "subnet" {
    depends_on = [ module.vnet ]
    source = "../child/subnet"
    subnet   = var.subnet_x
  
}

module "pip" {
    depends_on = [ module.rg]
    source = "../child/pip"
    pip   = var.pip_x
  
}
module "nic" {
    depends_on = [ module.rg, module.subnet]
    source = "../child/nic"
    nic-frontend   = var.nic-frontend
    nic-backend   = var.nic-backend 
}

module "vm" {
    depends_on = [ module.rg, module.nic, module.pip]
    source = "../child/vm"
    vm   = var.vm_x 
  
}