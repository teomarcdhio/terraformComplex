variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "resource_gp_location" {
  type = string
}

variable "resource_gp_name" {
  type = string
}

variable "location" {
  type = string
  default = "uksouth"
}

variable "domain_name_prefix" {
  type = string
}

variable "subnet_backend_id" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "subnet_frontend_id" {
  type = string
}
 
