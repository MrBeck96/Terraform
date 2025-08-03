#Resource group
resource "azurerm_resource_group" "rg" {
  name          = var.rg_name
  location      = var.location 
}


#Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                  = var.vnet_name
  address_space         = var.address_space 
  location              = azurerm_resource_group.rg.location 
  resource_group_name   = azurerm_resource_group.rg.name 
}


#Subnet 1
resource "azurerm_subnet" "module_sn1" {
  name                  = var.sn1_name
  resource_group_name   = azurerm_resource_group.rg.name 
  virtual_network_name  = azurerm_virtual_network.vnet.name
  address_prefixes      = var.subnet_prefix1  
}


#Subnet 2
resource "azurerm_subnet" "module_sn2" {
  name                  = var.sn2_name
  resource_group_name   = azurerm_resource_group.rg.name 
  virtual_network_name  = azurerm_virtual_network.vnet.name 
  address_prefixes      = var.subnet_prefix2 
}


