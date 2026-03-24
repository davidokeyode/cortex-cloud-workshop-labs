# Intentionally misconfigured — Azure SQL without auditing
resource "azurerm_mssql_server" "no_audit" {
  name                         = "cortex-lab-sql-noaudit"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssword123!"

  public_network_access_enabled = true
}

resource "azurerm_mssql_database" "sample_db" {
  name      = "cortex-lab-db"
  server_id = azurerm_mssql_server.no_audit.id
  sku_name  = "Basic"
}
