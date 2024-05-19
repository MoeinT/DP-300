output "sqldb-id" {
  value = { for i, j in azurerm_mssql_database.AllDBs : i => j.id }
}
