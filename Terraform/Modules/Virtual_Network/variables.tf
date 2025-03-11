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


# RESOURCE VARIABLES
variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default = "example-rg"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
  default     = "example-network"
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1","subnet2"] //["subnet1", "subnet2", "subnet3"] 
}

variable "network_security_group_name" {
  description = "Name of the network security group to be imported."
  type        = string
  default     = "example-nsg"
}