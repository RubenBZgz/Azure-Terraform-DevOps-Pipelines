# src: https://github.com/Azure/terraform-azurerm-vnet/blob/master/main.tf
#Azure Generic vNet Module
/*data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}*/

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  //resource_group_name = data.azurerm_resource_group.vnet.name
  //location            = data.azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  location            = azurerm_resource_group.vnet.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  //resource_group_name  = data.azurerm_resource_group.vnet.name
  resource_group_name = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  //resource_group_name = data.azurerm_resource_group.vnet.name
  //location            = data.azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  location            = azurerm_resource_group.vnet.location
}


locals {
  azurerm_subnets = [for s in azurerm_subnet.subnet : s]
  azurerm_subnets_name_id_map = {
    for index, subnet in local.azurerm_subnets :
    subnet.name => subnet.id
  }
}

resource "azurerm_subnet_network_security_group_association" "vnet" {
  #for_each = var.subnet_names
  for_each = toset(var.subnet_names)

  network_security_group_id = each.value
  subnet_id                 = local.azurerm_subnets_name_id_map[each.key]
}
