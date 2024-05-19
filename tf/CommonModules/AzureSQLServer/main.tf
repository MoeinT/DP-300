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

resource "azurerm_mssql_server" "AllServers" {
  for_each                      = var.properties
  name                          = can(each.value.name) ? each.value.name : each.key
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  version                       = lookup(each.value, "version", "12.0")
  administrator_login           = lookup(each.value, "administrator_login", null)
  administrator_login_password  = lookup(each.value, "administrator_login_password", null)
  minimum_tls_version           = lookup(each.value, "minimum_tls_version", "1.2")
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled", false)
  tags                          = can(each.value.tags) ? merge(local.DefaultTags, each.value.tags) : local.DefaultTags

  dynamic "azuread_administrator" {
    for_each = can(each.value.azuread_administrator) ? [1] : []
    content {
      login_username              = each.value.azuread_administrator.login_username
      object_id                   = each.value.azuread_administrator.object_id
      tenant_id                   = lookup(each.value.azuread_administrator, "tenant_id", null)
      azuread_authentication_only = lookup(each.value.azuread_administrator, "azuread_authentication_only", null)
    }
  }
}
