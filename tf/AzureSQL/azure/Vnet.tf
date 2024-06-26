# Define a Virtual Network
module "Vnets" {
  source = "../../CommonModules/Vnet"
  properties = {
    "dp-300-vnet-${var.env}" = {
      address_space       = ["10.0.0.0/16"]
      location            = module.Rg.rg-locations["dp-300-${var.env}"]
      resource_group_name = module.Rg.rg-names["dp-300-${var.env}"]
    }
  }
}

# Define a subnet within the Vnet
module "Subnets" {
  source = "../../CommonModules/Subnet"
  properties = {
    "dp-300-subnet-${var.env}" = {
      resource_group_name  = module.Rg.rg-names["dp-300-${var.env}"],
      virtual_network_name = module.Vnets.vnet-name["dp-300-vnet-${var.env}"],
      address_prefixes     = ["10.0.0.0/24"]
      service_endpoints    = ["Microsoft.Sql"]
    }
  }
}

# Adding a NSG at the subnet level
module "NSGSubnetAttachment" {
  source = "../../CommonModules/NSGSubnetAssociation"
  properties = {
    "source-subnet-NSG-${var.env}" = {
      subnet_id                 = module.Subnets.subnet-id["dp-300-subnet-${var.env}"],
      network_security_group_id = module.NSGs.nsg-id["app-public-nsg-${var.env}"]
    },
  }
}
