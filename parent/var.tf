variable "rg_x" {
  type = map(object({
    name     = string
    location = string
  }))
}


variable "vnet_x" {
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string

  }))
}

variable "subnet_x" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)

  }))

}

variable "nic-frontend" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    subnet_name          = string
    virtual_network_name = string
    ip_configuration = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))

}
variable "nic-backend" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    subnet_name          = string
    virtual_network_name = string
    ip_configuration = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))

}


variable "pip_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))

}

variable "vm_x" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    network_interface_name          = string
    disable_password_authentication = bool
    os_disk = map(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

  }))

}