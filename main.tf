terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.32.0"
    }
  }
}

provider "azurerm" {
  client_id       = "#{_CLIENT-ID_}#"
  client_secret   = "#{_CLIENT-SECRET_}#"
  tenant_id       = "#{_TENANT-ID_}#"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.rglocation
}

resource "azurerm_storage_account" "strgacc" {
  name                     = var.strgaccname
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
