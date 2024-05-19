module "PrivateEndpoints" {
  source = "../../CommonModules/AzurePrivateEndpoint"
  properties = {
    "dp-300-sqlserver-pe-${var.env}" = {
      location            = module.Rg.rg-locations["dp-300-${var.env}"],
      resource_group_name = module.Rg.rg-names["dp-300-${var.env}"],
      subnet_id           = module.Subnets.subnet-id["dp-300-subnet-${var.env}"]

      private_service_connection = {
        name                           = "sqlserver-pe-connection"
        is_manual_connection           = false
        private_connection_resource_id = module.SQLServers.server-id["dp-300-sql-server-${var.env}"]
        subresource_names              = ["sqlServer"]
      }

      private_dns_zone_group = {
        name                 = module.AzurePrivateDNSZone.privatezone-name["azureprivatezone-${var.env}"]
        private_dns_zone_ids = [module.AzurePrivateDNSZone.privatezone-id["azureprivatezone-${var.env}"]]
      }

    }
  }
}
