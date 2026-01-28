rg_x = {
  "rgo1" = {
    name     = "vishnu-rg"
    location = "Central india"
  }
}

vnet_x = {
  "vnet1" = {
    name                = "vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "Central india"
    resource_group_name = "vishnu-rg"
  }
}

subnet_x = {
  "subnet1" = {
    name                 = "frontend-subnet"
    resource_group_name  = "vishnu-rg"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.1.0/25"]

  }
  "subnet2" = {
    name                 = "appgw-subnet"
    resource_group_name  = "vishnu-rg"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.2.0/24"]

  }
  "subnet3" = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "vishnu-rg"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.3.0/26"]

  }
}

nic_x = {
  "nic1" = {
    name                 = "frontend-nic"
    location             = "Central india"
    resource_group_name  = "vishnu-rg"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet"
    ip_configuration = {
      "ipconfig1" = {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
  "nic2" = {
    name                 = "backend-nic"
    location             = "Central india"
    resource_group_name  = "vishnu-rg"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "vnet"
    ip_configuration = {
      "ipconfig1" = {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

pip_x = {
  "pip1" = {
    name                = "frontend-pip"
    location            = "Central india"
    resource_group_name = "vishnu-rg"
    allocation_method   = "Static"
    sku                 = "Standard"

  }
  "pip2" = {
    name                = "backend-pip"
    location            = "Central india"
    resource_group_name = "vishnu-rg"
    allocation_method   = "Static"
    sku                 = "Standard"

  }
}

# vm_x = {
#   "vm1" = {
#     name                            = "frontend-vm"
#     location                        = "Central India"
#     resource_group_name             = "vishnu-rg"
#     size                            = "Standard_D2s_v3"
#     admin_username                  = "vm-user"
#     admin_password                  = "vm-pass"
#     disable_password_authentication = false
#     network_interface_name          = "frontend-nic"

#     os_disk = {
#       "osdisk1" = {
#         name                 = "diskvm1"
#         caching              = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#         disk_size_gb         = 30
#       }
#     }

#     source_image_reference = {
#       "image1" = {
#         publisher = "Canonical"
#         offer     = "0001-com-ubuntu-server-jammy"
#         sku       = "22_04-LTS"
#         version   = "latest"
#       }
#     }
#   }
#   "vm2" = {
#     name                            = "backend-vm"
#     location                        = "Central India"
#     resource_group_name             = "vishnu-rg"
#     size                            = "Standard_D2s_v3"
#     admin_username                  = "vm-user"
#     admin_password                  = "vm-pass"
#     disable_password_authentication = false
#     network_interface_name          = "backend-nic"

#     os_disk = {
#       "osdisk2" = {
#         name                 = "diskvm2"
#         caching              = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#         disk_size_gb         = 30
#       }
#     }

#     source_image_reference = {
#       "image2" = {
#         publisher = "Canonical"
#         offer     = "0001-com-ubuntu-server-jammy"
#         sku       = "22_04-LTS"
#         version   = "latest"
#       }
#     }
#   }
# }

vmss_x = {
  vmss1 = {
    name                = "frontend-vmss"
    location            = "Central India"
    resource_group_name = "vishnu-rg"
    sku          = "Standard_D2s_v3"
    instances   = 2
    upgrade_mode = "Manual"
    admin_username = "vm-user"
    admin_password = "vm-pass"
    disable_password_authentication = false
    virtual_network_name = "vnet"
    subnet_name          = "frontend-subnet"

    network_interface = {
      nic1 = {
        name    = "vmss-nic"
        primary = true

        ip_configuration = {
          ipconfig1 = {
            name    = "internal"
            primary = true
          }
        }
      }
    }

    os_disk = {
      osdisk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 30
      }
    }

    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    }
  }
}

mssql_x = {
  sql1 = {
    name                         = "vishnu-sqlserver"
    resource_group_name          = "vishnu-rg"
    location                     = "Central India"
    version                      = "12.0"
    administrator_login          = "sql-user"
    administrator_login_password = "sql-pass"
    minimum_tls_version          = "1.2"
  }

}
databases_x = {
  db1 = {
    name         = "vishnudb"
    sku_name     = "S0"
    enclave_type = "VBS"
    max_size_gb  = 2
  }
}

bastion_x = {
  bastion1 = {
    name                = "vishnu-bastion"
    location            = "Central India"
    resource_group_name = "vishnu-rg"
    sku                 = "Standard"

    vnet_name           = "vnet"
    bastion_subnet_name = "azurerm_bastion_host"
    public_ip_name      = "frontend-pip"

    ip_configuration = {
      ipconfig1 = {
        name = "bastion-ipconfig"
      }
    }
  }
}

nsgs_x = {
  nsg1 = {
    name                = "frontend-nsg"
    location            = "Central India"
    resource_group_name = "vishnu-rg"

    security_rules = {
      rule1 = {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      rule2 = {
        name                       = "Allow-HTTPS"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
  nsg2 = {
    name                = "backend-nsg"
    location            = "Central India"
    resource_group_name = "vishnu-rg"

    security_rules = {
      rule1 = {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      rule2 = {
        name                       = "Allow-HTTPS"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

application_gateway_x = {
  appgw1 = {
    name                = "frontend-appgw"
    location            = "centralindia"
    resource_group_name = "vishnu-rg"

    sku = {
      name     = "Standard_v2"
      tier     = "Standard_v2"
      capacity = 2
    }

    gateway_ip_configurations = {
      gwip1 = {
        name = "appgw-ip-config"
      }
    }

    frontend_ports = {
      http = {
        name = "frontend-http"
        port = 80
      }
    }

    frontend_ip_configurations = {
      public = {
        name = "frontend-public-ip"
      }
    }

    backend_address_pools = {
      backend1 = {
        name  = "backend-pool-01"
        fqdns = ["example.com"]
      }
    }

    backend_http_settings = {
      http-setting = {
        name                  = "http-setting-01"
        cookie_based_affinity = "Disabled"
        port                  = 80
        protocol              = "Http"
        request_timeout       = 30
      }
    }

    http_listeners = {
      listener1 = {
        name                           = "http-listener-01"
        frontend_ip_configuration_name = "frontend-public-ip"
        frontend_port_name             = "frontend-http"
        protocol                       = "Http"
      }
    }

    request_routing_rules = {
      rule1 = {
        name                       = "rule-01"
        rule_type                  = "Basic"
        http_listener_name         = "http-listener-01"
        backend_address_pool_name  = "backend-pool-01"
        backend_http_settings_name = "http-setting-01"
        priority                   = 100
      }
    }
  }
}
