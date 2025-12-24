variable "nic" {
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
