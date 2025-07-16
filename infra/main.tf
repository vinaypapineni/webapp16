terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "webapp16-rg-${var.environment}"
  location = var.location
}

resource "azurerm_app_service_plan" "asp" {
  name                = "webapp16-asp-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Windows"
  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "app" {
  name                = "webapp16-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
}
