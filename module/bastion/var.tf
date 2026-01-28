variable "bastion" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string

    vnet_name           = string
    bastion_subnet_name = string # 👈 no hardcode
    public_ip_name      = string

    ip_configuration = map(object({
      name = string
    }))
  }))
}
