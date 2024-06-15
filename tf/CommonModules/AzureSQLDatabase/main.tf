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

resource "azurerm_mssql_database" "AllDBs" {
  for_each                                     = var.properties
  name                                         = can(each.value.name) ? each.value.name : each.key
  server_id                                    = each.value.server_id
  collation                                    = lookup(each.value, "collation", null)
  license_type                                 = lookup(each.value, "license_type", null)
  max_size_gb                                  = lookup(each.value, "max_size_gb", 2)
  read_scale                                   = lookup(each.value, "read_scale", false)
  sku_name                                     = each.value.sku_name
  zone_redundant                               = lookup(each.value, "zone_redundant", false)
  storage_account_type                         = lookup(each.value, "storage_account_type", "Geo")
  enclave_type                                 = lookup(each.value, "enclave_type", "VBS")
  sample_name                                  = lookup(each.value, "sample_name", null)
  transparent_data_encryption_enabled          = lookup(each.value, "transparent_data_encryption_enabled", true)
  tags                                         = can(each.value.tags) ? merge(local.DefaultTags, each.value.tags) : local.DefaultTags
  transparent_data_encryption_key_vault_key_id = lookup(each.value, "transparent_data_encryption_key_vault_key_id", null)
  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
