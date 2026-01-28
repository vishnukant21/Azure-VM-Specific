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

variable "nic_x" {
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

# variable "vm_x" {
#   type = map(object({
#     name                            = string
#     location                        = string
#     resource_group_name             = string
#     size                            = string
#     admin_username                  = string
#     admin_password                  = string
#     network_interface_name          = string
#     disable_password_authentication = bool
#     os_disk = map(object({
#       name                 = string
#       caching              = string
#       storage_account_type = string
#       disk_size_gb         = number
#     }))
#     source_image_reference = map(object({
#       publisher = string
#       offer     = string
#       sku       = string
#       version   = string
#     }))

#   }))

# }

variable "vmss_x" {
  description = "VM Scale Set configuration passed to child module"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku          = string
    instances   = number
    upgrade_mode = string
    disable_password_authentication = bool
    virtual_network_name = string
    subnet_name          = string

    network_interface = map(object({
      name    = string
      primary = bool

      ip_configuration = map(object({
        name     = string
        primary = bool
      }))
    }))

    os_disk = map(object({
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


variable "mssql_x" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))
}

variable "databases_x" {
  type = map(object({
    name         = string
    sku_name     = string
    enclave_type = string
    max_size_gb  = number
  }))
}

variable "bastion_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    vnet_name           = string
    bastion_subnet_name = string
    public_ip_name      = string

    ip_configuration = map(object({
      name = string
    }))
  }))
}

variable "nsgs_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    security_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "application_gateway_x" {
  description = "Application Gateway configuration map"
  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

    sku = object({
      name     = string
      tier     = string
      capacity = number
    })

    gateway_ip_configurations = map(object({
      name = string
    }))

    frontend_ports = map(object({
      name = string
      port = number
    }))

    frontend_ip_configurations = map(object({
      name = string
    }))

    backend_address_pools = map(object({
      name  = string
      fqdns = optional(list(string))
    }))

    backend_http_settings = map(object({
      name                  = string
      cookie_based_affinity = string
      port                  = number
      protocol              = string
      request_timeout       = number
    }))

    http_listeners = map(object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      protocol                       = string
    }))

    request_routing_rules = map(object({
      name                       = string
      rule_type                  = string
      http_listener_name         = string
      backend_address_pool_name  = string
      backend_http_settings_name = string
      priority                   = number
    }))

  }))
}
