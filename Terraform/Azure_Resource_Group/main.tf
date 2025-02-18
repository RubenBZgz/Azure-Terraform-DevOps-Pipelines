resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "insecure" {
  name                     = "insecurestorageacct"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # This setting is insecure – secure transfer should be enabled.
  https_traffic_only_enabled = false

  tags = {
    environment = "dev"
  }
}