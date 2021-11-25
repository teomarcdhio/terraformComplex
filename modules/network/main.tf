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


# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_gp_location
  resource_group_name = var.resource_gp_name
}

## Create a simple subnet inside of the vNet ensuring the VMs are created first (depends_on)
resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = var.resource_gp_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  resource_group_name  = var.resource_gp_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

## Create an Azure network security group.
resource "azurerm_network_security_group" "nsg1" {
  name                = "nsg"
  location            = var.resource_gp_location
  resource_group_name = var.resource_gp_name
}

