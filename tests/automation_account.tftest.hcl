mock_provider "azurerm" {}

# The test asserts nothing about diagnostics. Overriding the module keeps the
# test independent of data sources a later diagnostics tag may add.
override_module {
  target = module.diag
}

variables {
  automation_account_name    = "test-aa"
  resource_group_name        = "test-rg"
  location                   = "usgovvirginia"
  log_analytics_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/test-law"
  tags                       = { Environment = "test" }
}

run "secure_defaults" {
  command = plan

  assert {
    condition     = azurerm_automation_account.aa.public_network_access_enabled == false
    error_message = "public_network_access_enabled must default to false."
  }

  assert {
    condition     = azurerm_automation_account.aa.local_authentication_enabled == false
    error_message = "local_authentication_enabled must default to false."
  }

  assert {
    condition     = azurerm_automation_account.aa.identity[0].type == "SystemAssigned"
    error_message = "The Automation Account must use a SystemAssigned identity."
  }

  assert {
    condition     = azurerm_automation_account.aa.sku_name == "Basic"
    error_message = "sku_name must be Basic."
  }

  assert {
    condition     = azurerm_automation_account.aa.tags == tomap({ Environment = "test" })
    error_message = "The tags input must be applied to the Automation Account unchanged."
  }
}

run "overrides_flow_through" {
  command = plan

  variables {
    public_network_access_enabled = true
    local_authentication_enabled  = true
  }

  assert {
    condition     = azurerm_automation_account.aa.public_network_access_enabled == true
    error_message = "public_network_access_enabled = true must reach the resource."
  }

  assert {
    condition     = azurerm_automation_account.aa.local_authentication_enabled == true
    error_message = "local_authentication_enabled = true must reach the resource."
  }
}
