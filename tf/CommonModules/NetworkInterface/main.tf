terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_network_interface" "NetInterface" {
  for_each             = var.properties
  name                 = each.key
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  enable_ip_forwarding = lookup(each.value, "enable_ip_forwarding", false)

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = each.value.ip_configuration.subnet_id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = lookup(each.value.ip_configuration, "public_ip_address_id", null)
    private_ip_address            = lookup(each.value.ip_configuration, "private_ip_address", null)
  }
}