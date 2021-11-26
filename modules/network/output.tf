output "subnet_backend_id" {
    value = azurerm_subnet.backend.id 
}

output "subnet_backend" {
    value = azurerm_subnet.backend 
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_frontend_id" {
    value = azurerm_subnet.frontend.id
}