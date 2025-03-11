# GLOBAL
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  default     = ""
}

variable "location" {
  type        = string
  description = "Resource location"
  default     = "West Europe"
}

/*
variable "min_tls_version" {
  description = "The minimum TLS version for the storage account"
  type        = string
  default     = "TLS1_2"
}

variable "account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
  default     = "LRS"
}*/


# RESOURCE VARIABLES
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

variable "virtual_network_name" {
  type        = string
  description = "VNET name in Azure"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name in Azure"
}

variable "network_interface_name" {
  type        = string
  description = "NIC name in Azure"
}

variable "windows_vm_name" {
  type        = string
  description = "Windows VM name in Azure"
}
