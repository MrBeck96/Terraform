
output "storage_container_name" {
  value = azurerm_storage_container.remote_state_container.name
}

output "vnet_address_space" {
  value = module.child.vnet_address_space
}

output "vnet_name" {
  value = module.child.vnet_name
}