
resource "azurerm_resource_group" "az_rg" {
  name     = "${local.name}-rg"
  location = var.location
}


resource "azurerm_storage_account" "storage_account" {
  name                      = local.storage
  resource_group_name       = azurerm_resource_group.az_rg.name
  location                  = azurerm_resource_group.az_rg.location
  account_tier              = "Standard" 
  account_replication_type  = "LRS"
}


resource "azurerm_storage_container" "remote_state_container" {
  name                  = "${local.name}-ct"
  storage_account_name  =  azurerm_storage_account.storage_account.name 
  container_access_type = "private"
}


resource "azurerm_storage_blob" "remote_state_blob" {
  name                   = "${local.name}-bl "
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.remote_state_container.name
  type                   = "Block"
}




# This is the child module call to create a Vnet and two subnets
module "child" {
  source          = "./module"
  rg_name         = "tf-d-eu-app1-rg"
  location        = "eastus"
  vnet_name       = "tf-d-eu-app1-vn"
  address_space   = [ "10.1.0.0/16" ]
  sn1_name        = "tf-d-eu-app1-1-sn"
  subnet_prefix1  = [ "10.1.0.0/24" ]
  sn2_name        = "tf-d-eu-app1-2-sn"
  subnet_prefix2  = [ "10.1.1.0/24" ]
}


