# App Gateway module

This module takes care of settign up the Azure App Gateway 

## Folder structure

main.tf - terraform main script <br />
output.tf - any data required by other modules <br />
variables.tf - variable definition for the module <br />

## Secrets

These are transfered to the module from the variables defined in the main enviornment ( Dev, Prod, etc )