resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  for_each = var.vmss
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku       = each.value.sku
  instances = each.value.instances
  upgrade_mode = each.value.upgrade_mode
  admin_username                  = data.azurerm_key_vault_secret.vm-user.value
  admin_password                  = data.azurerm_key_vault_secret.vm-pass.value
  disable_password_authentication = each.value.disable_password_authentication

  dynamic "network_interface" {
    for_each = each.value.network_interface
    content {
      name    = network_interface.value.name
      primary = network_interface.value.primary

      dynamic "ip_configuration" {
        for_each = network_interface.value.ip_configuration
        content {
          name      = ip_configuration.value.name
          primary  = ip_configuration.value.primary
          subnet_id = data.azurerm_subnet.subnet[each.key].id
        }
      }
    }
  }

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
      disk_size_gb         = os_disk.value.disk_size_gb
    }
  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
}