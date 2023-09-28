resource "azurerm_automation_account" "aa" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Basic"

  identity {
    type = "SystemAssigned"
  }

  tags = merge({
    Function    = "Automation"
    Plane       = "Management"
  }, var.global_tags, var.regional_tags)
}

resource "azurerm_log_analytics_linked_service" "aa_la_link" {
  resource_group_name = var.resource_group_name
  workspace_id        = var.log_analytics_workspace_id
  read_access_id      = azurerm_automation_account.aa.id
}