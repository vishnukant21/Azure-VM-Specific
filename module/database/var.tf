variable "databases" {
  type = map(object({
    name         = string
    sku_name     = string
    enclave_type = string
    max_size_gb  = number
  }))
}