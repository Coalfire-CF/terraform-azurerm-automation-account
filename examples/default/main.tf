terraform {
  required_version = ">= 1.16.6, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.10"
    }
  }
}

# Set ARM_SUBSCRIPTION_ID before running. azurerm 4.0 and later require a subscription ID.
provider "azurerm" {
  features {}
  environment                     = "usgovernment"
  resource_provider_registrations = "none"
}

module "automation_account" {
  source = "../../"

  automation_account_name    = var.automation_account_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags                       = var.tags
}
