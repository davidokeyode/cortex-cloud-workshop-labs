# Intentionally misconfigured — Storage account with public blob access
resource "azurerm_storage_account" "public_storage" {
  name                     = "cortexlabpublicstorage"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = true

  blob_properties {
    versioning_enabled = false
  }
}

resource "azurerm_storage_container" "public_container" {
  name                  = "publicdata"
  storage_account_id    = azurerm_storage_account.public_storage.id
  container_access_type = "blob"
}
