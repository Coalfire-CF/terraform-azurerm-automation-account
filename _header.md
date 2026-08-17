![Coalfire](coalfire_logo.png)

# terraform-azurerm-automation-account

## Description

Module to create an Automation Account. It is used in the [Coalfire-Azure-RAMPpak](https://github.com/Coalfire-CF/Coalfire-Azure-RAMPpak) FedRAMP Framework. 

Learn more at [Coalfire OpenSource](https://coalfire.com/opensource).

## Dependencies

- Security Core
- Region Setup

## Code Updates

If using the [Coalfire-Azure-RAMPpak](https://github.com/Coalfire-CF/Coalfire-Azure-RAMPpak) FedRAMP Framework, update `tstate.tf` to the appropriate version and storage accounts, see sample:

``` hcl
terraform {
  required_version = "~>1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ex-prod-va-mp-core-rg"
    storage_account_name = "exprodvampsatfstate"
    container_name       = "vaextfstatecontainer"
    environment          = "usgovernment"
    key                  = "va-az-automation.tfstate"
  }
}
```

## Deployment Steps

This module can be called as outlined below.

- Change directories to the `terraform-azurerm-automation-account` directory.
- From the `terraform-azurerm-automation-account` directory run `terraform init`.
- Update the necessary variables
- Run `terraform plan` to review the resources being created.
- If everything looks correct in the plan output, run `terraform apply`.

## Usage

Include example for how to call the module below with generic variables

```hcl
provider "azurerm" {
  features {}
}

module "va-aa" {
  source                     = "github.com/Coalfire-CF/terraform-azurerm-automation-account"
  automation_account_name    = "${local.resource_prefix}-aa"
  resource_group_name        = data.terraform_remote_state.setup.outputs.management_rg_name
  location                   = var.location
  log_analytics_workspace_id = data.terraform_remote_state.core.outputs.core_la_id

  global_tags = var.global_tags
  regional_tags = merge({
    Function    = "Automation"
    Plane       = "Management"
    Environment = "Production"
  }, var.regional_tags, local.global_local_tags)
}
```


