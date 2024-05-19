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

resource "azurerm_mssql_virtual_network_rule" "AllRules" {
  for_each  = var.properties
  name      = can(each.value.name) ? each.value.name : each.key
  server_id = each.value.server_id
  subnet_id = each.value.subnet_id
}
