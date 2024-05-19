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

resource "azurerm_mssql_firewall_rule" "AllFirewallRules" {
  for_each         = var.properties
  name             = can(each.value.name) ? each.value.name : each.key
  server_id        = each.value.server_id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}
