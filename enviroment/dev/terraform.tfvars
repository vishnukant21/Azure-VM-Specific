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
    address_prefixes     = ["10.0.1.0/24"]

  }
  "subnet2" = {
    name                 = "backend-subnet"
    resource_group_name  = "vishnu-rg"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.2.0/24"]

  }
}

nic-frontend = {
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
}
nic-backend = {
  "nic2" = {
    name                 = "backend-nic"
    location             = "Central india"
    resource_group_name  = "vishnu-rg"
    subnet_name          = "backend-subnet"
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

vm_x = {
  "vm1" = {
    name                            = "frontend-vm"
    location                        = "Central India"
    resource_group_name             = "vishnu-rg"
    size                            = "Standard_B1s"
    admin_username                  = "azurevishnu"
    admin_password                  = "Vishnu@12345"
    disable_password_authentication = false
    network_interface_name          = "frontend-nic"

    os_disk = {
      "osdisk1" = {
        name                 = "diskvm"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = 30
      }
    }

    source_image_reference = {
      "image1" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-LTS"
        version   = "latest"
      }
    }
  }
}

