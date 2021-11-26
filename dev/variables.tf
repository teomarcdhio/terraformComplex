variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "resource_group" {
  type = string
  default = "dev"
}

variable "location" {
  type = string
  default = "uksouth"
}

variable "domain_name_prefix" {
  type = string
}

variable "winvmuser" {
  type = string
  default = "devadmin"
}

variable "winvmpass" {
  type = string
}

variable "az_domain" {
  type = string
}

variable "az_domain_username" {
  type = string
}

variable "az_domain_dc_1" {
  type = string
}

variable "az_domain_password" {
  type = string
}

variable "management_ip" {
  type = string
}

variable "linuxuser" {
  type = string
  default = "devadmin"
}

variable "webservercount" {
  type = number
  default = 1
}

variable "enviornment" {
  type = string
  default = "dev"
}