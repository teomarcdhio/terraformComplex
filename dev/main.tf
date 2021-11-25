# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}
## Ensure you're using 2.0+ of the azurevm provider to get the azurerm_windows_virtual_machine reosurce and
## the other resources and capabilities
provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

## Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location

  tags = {
    Environment = "Terraform"
    Team        = "DevOps"
  }
}

## Create network usign module; passing the values for subscription_id, tenant_id, rg.location and rg.name as variabels to the module 
module "network" {
    source = "../modules/network"
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    resource_gp_location = azurerm_resource_group.rg.location
    resource_gp_name = azurerm_resource_group.rg.name
}