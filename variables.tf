
variable "location" {
  type = string

  validation {
    condition       = contains(["eastus", "centralus"], var.location)
    error_message   = "Invalid location provided. Must be either eastus or centralus"
  }
}


