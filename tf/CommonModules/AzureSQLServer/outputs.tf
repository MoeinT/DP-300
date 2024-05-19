output "server-id" {
  value = { for i, j in azurerm_mssql_server.AllServers : i => j.id }
}
