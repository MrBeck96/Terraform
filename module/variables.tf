variable "rg_name" {
  type = string
  default = "value"
}


variable "location" {
  type = string

  validation {
    condition       = contains(["eastus", "centralus"], var.location)
    error_message   = "Invalid location provided. Must be either eastus or centralus"
  }
}

variable "vnet_name" {
  type = string
}

variable "sn1_name" {
  type = string
}


variable "sn2_name" {
  type = string
}

variable "address_space" {
    type = list(string)
}   

variable "subnet_prefix1" {
    type = list(string)
}

variable "subnet_prefix2" {
    type = list(string)
}
