resource "azurerm_automation_account" "aa" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Basic"

  identity {
    type = "SystemAssigned"
  }

  tags = merge(var.global_tags, var.regional_tags)
}
