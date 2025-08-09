
locals {
  base        = "tf"
  name        = "${local.base}-${var.environment}-${var.azure_region}-${var.app}"
  storage     = "tfdeusa"
}
