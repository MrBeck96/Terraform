locals {
  location    = "eu"
  environment = "d"
  base        = "tf"
  app         = "app1"
  name        = "${local.base}-${local.environment}-${local.location}-${local.app}"
  storage     = "tfdeusa"
}
