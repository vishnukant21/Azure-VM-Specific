variable "vmss" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    sku          = string
    instances   = number
    upgrade_mode = string

    disable_password_authentication = bool

    # 🔥 YE DONO MISSING THE
    virtual_network_name = string
    subnet_name          = string

    network_interface = map(object({
      name    = string
      primary = bool

      ip_configuration = map(object({
        name    = string
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