output "webserverIps" {
  value      = azurerm_public_ip.webserverIps.*.ip_address
  depends_on = [azurerm_windows_virtual_machine.webserverVMs]
}
