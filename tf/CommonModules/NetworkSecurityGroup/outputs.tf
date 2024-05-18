output "nsg-id" {
  value = { for i, j in azurerm_network_security_group.NSG : j.name => j.id }
}

output "nsg-name" {
  value = { for i, j in azurerm_network_security_group.NSG : j.name => j.name }
}