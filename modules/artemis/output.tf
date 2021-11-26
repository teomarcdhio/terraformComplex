
output "tls_private_key" {
  value     = tls_private_key.test_ssh.private_key_pem
  sensitive = true
}

output "artemisIps" {
  value = azurerm_public_ip.artemisIps.*.ip_address
  depends_on  = [azurerm_public_ip.artemisIps]
}