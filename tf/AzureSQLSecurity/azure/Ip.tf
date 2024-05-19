# This public IP address allows connectivity from the internet
module "publicIPs" {
  source = "../../CommonModules/PublicIp"
  properties = {
    # To log into vmCentral and enable routing
    "dp-300-public-ip-${var.env}" = {
      location            = module.Rg.rg-locations["dp-300-${var.env}"],
      resource_group_name = module.Rg.rg-names["dp-300-${var.env}"],
      allocation_method   = "Static",
      sku                 = "Basic"
    }
  }
}
