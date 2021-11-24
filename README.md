# Terraform automation scripts 

This repository includes all scripts used to build the infrastrucre for Echo production, staging and dev enviornments.

## Folder structure

Each enviornmnet has one folder with a main, output and variables files. The main will invoke modules such as network, appgateway, applicationserver, webserver, etc.