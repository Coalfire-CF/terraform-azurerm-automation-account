![Coalfire](coalfire_logo.png)

# terraform-azurerm-automation-account

## Description

Module to create an Automation Account with a system-assigned managed identity. It is used in the [Coalfire-Azure-RAMPpak](https://github.com/Coalfire-CF/Coalfire-Azure-RAMPpak) FedRAMP Framework.

Learn more at [Coalfire OpenSource](https://coalfire.com/opensource).

## Dependencies

A resource group and a Log Analytics workspace, both supplied by the caller.

## Network

Public network access is off by default. The caller creates private endpoints, for example with
[terraform-azurerm-private-endpoint](https://github.com/Coalfire-CF/terraform-azurerm-private-endpoint),
using the `aa_id` output and the `Webhook` and `DSCAndHybridWorker` subresource names.

## Authentication

Local (key-based) authentication is off by default. Webhooks, DSC key registration and
agent-based hybrid workers need `local_authentication_enabled = true`. Runbooks use the
system-assigned identity.

## Outputs

`aa_primary_registration_key` is sensitive. It is exposed only for DSC node registration.

## Logging

Diagnostic logs go to `log_analytics_workspace_id` through
[terraform-azurerm-diagnostics](https://github.com/Coalfire-CF/terraform-azurerm-diagnostics).

## Usage

See [examples/default](examples/default) for a complete root. Set `ARM_SUBSCRIPTION_ID` before
running it.

```hcl
module "automation_account" {
  source = "git::https://github.com/Coalfire-CF/terraform-azurerm-automation-account?ref=v2.0.0"

  automation_account_name    = var.automation_account_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id

  tags = var.tags
}
```
