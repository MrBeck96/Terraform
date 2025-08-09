
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
  # d=dev, s=staging, p=prod 
  type              = string

  validation {
    condition       = contains(["d", "s", "p"], var.environment)
    error_message   = "Invalid environment initial provided. Must be d (dev), s (staging), or p (prod)"
  }
}

variable "app" {
  description       = "The application name"
  type              = string
}

variable "azure_region" {
  description       = "Initials for the Azure regions where the resources are deployed to"
  # eu=eastus, cu=centralus
  type              = string

  validation {
  condition         = contains(["eu", "cu"], var.azure_region)
  error_message     = "The location initials must either be eu or cu"
  }
}