
variable "resource_group" {
  description       = "This is the resource group for the resources"
  type              = string
}

variable "location" {
  description       = "This is the location where the resources will be deployed"
  type              = string

  validation {
    condition       = contains(["eastus", "centralus"], var.location)
    error_message   = "Invalid location provided. Must be either eastus or centralus"
  }
}

variable "environment" {
  description       = "The initials for the environment: d, s, p"
  type              = string
  # d = dev, s = staging, p = prod 

  validation {
    condition       = contains(["d", "s", "p"], var.environment)
    error_message   = "Invalid environment provided. Must be d, s, or p"
  }
}

variable "base" {
  description       = "The base name for the resources"
  type              = string
  default           = "tf"
}

variable "app" {
  description       = "The application name"
  type              = string
}

variable "application_vnet_name" {
  description       = "The name for the application virtual network"
  type              = string
}

variable "first_subnet" {
  description       = "value"
  type              = string
}