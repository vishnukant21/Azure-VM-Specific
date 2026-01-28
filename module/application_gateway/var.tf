variable "application_gateway" {
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

