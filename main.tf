resource "azurerm_automation_account" "aa" {
  name                          = var.automation_account_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku_name                      = "Basic"
  public_network_access_enabled = var.public_network_access_enabled
  local_authentication_enabled  = var.local_authentication_enabled

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

module "diag" {
  source                = "git::https://github.com/Coalfire-CF/terraform-azurerm-diagnostics?ref=v2.0.0"
  diag_log_analytics_id = var.log_analytics_workspace_id
  resource_id           = azurerm_automation_account.aa.id
  resource_type         = "aa"
}
