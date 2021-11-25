# Terraform automation scripts 

This repository includes all scripts used to build the infrastrucre for Echo production, staging and dev enviornments.

## Folder structure

Each enviornmnet has one folder with a main, output and variables files. The main will invoke modules such as network, appgateway, applicationserver, webserver, etc.

## Secrets

For each enviormnet, create a secret file called terraform.auto.tfvars and provide the values for the required variables as below.These file is ingored in the git commit to maintain the data secure. Ideally use a secret storage solution such as Azure Key Vault or Hashicorp Vault.

subscription_id = "xxxxxx-xxxxxx-xxxxxx"
tenant_id = "xxxxxx-xxxxxxx-xxxxxxxx"
resource_group = "DevEnv"
location = "uksouth"