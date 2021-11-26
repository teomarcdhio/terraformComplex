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

## Create network usign module.
module "network" {
    source = "../modules/network"
    ## Passign variables across modules
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    resource_gp_location = azurerm_resource_group.rg.location
    resource_gp_name = azurerm_resource_group.rg.name
}

## Create the webserver usign module
module "webserver" {
    source = "../modules/webserver"
    ## Ensure the subnet is created first before creating these vNics.
    depends_on = [module.network]
    ## Passign variables across modules
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    resource_gp_location = azurerm_resource_group.rg.location
    resource_gp_name = azurerm_resource_group.rg.name
    domain_name_prefix = var.domain_name_prefix
    subnet_backend_id = module.network.subnet_backend_id
    location = var.location
    winvmuser = var.winvmuser
    winvmpass = var.winvmpass
#    az_domain = var.az_domain
#    az_domain_dc_1 = var.az_domain_dc_1
#    az_domain_password = var.az_domain_password
#    az_domain_username = var.az_domain_username

}

## Create the appGateway usign module.
module "appgateway" {
    source = "../modules/appgateway"
    ## Ensure the subnet is created first before creating these vNics.
    depends_on = [module.network]
    ## Passign variables across modules
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    resource_gp_location = azurerm_resource_group.rg.location
    resource_gp_name = azurerm_resource_group.rg.name
    domain_name_prefix = var.domain_name_prefix
    subnet_backend_id = module.network.subnet_backend_id
    location = var.location
    virtual_network_name = module.network.virtual_network_name
    subnet_frontend_id = module.network.subnet_frontend_id
}