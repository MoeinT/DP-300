# Creating a service endpoint for the SQL server
module "ServerVnetRule" {
  source = "../../CommonModules/AzureSQLVnetRule"
  properties = {
    "allow-dp-300-vnet-${var.env}" = {
      server_id = module.SQLServers.server-id["dp-300-sql-server-${var.env}"]
      subnet_id = module.Subnets.subnet-id["dp-300-subnet-${var.env}"]
    }
  }
}
