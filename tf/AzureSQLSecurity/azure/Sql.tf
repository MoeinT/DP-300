module "SQLServers" {
  source = "../../CommonModules/AzureSQLServer"
  properties = {
    "dp-300-sql-server-${var.env}" = {
      resource_group_name           = module.Rg.rg-names["dp-300-${var.env}"]
      location                      = module.Rg.rg-locations["dp-300-${var.env}"]
      public_network_access_enabled = true
      version                       = "12.0"
      administrator_login           = var.admin_username
      administrator_login_password  = var.admin_password
      minimum_tls_version           = "1.2"
    }
  }
}

module "SQLDatabase" {
  source = "../../CommonModules/AzureSQLDatabase"
  properties = {
    "dp-300-sql-database-${var.env}" = {
      server_id                           = module.SQLServers.server-id["dp-300-sql-server-${var.env}"]
      sku_name                            = "Basic"
      max_size_gb                         = 2
      sample_name                         = "AdventureWorksLT"
      zone_redundant                      = false
      storage_account_type                = "Local"
      transparent_data_encryption_enabled = true
    }
  }
}
