variable "vm" {
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