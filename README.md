<div align="center">
<img src="coalfire_logo.png" width="200">

</div>

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
  required_version = ">= 1.1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.45.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "prod-mp-core-rg"
    storage_account_name = "prodmpsatfstate"
    container_name       = "tfstatecontainer"
    environment          = "usgovernment"
    key                  = "automation.tfstate"
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

module "core_sa" {
  source                    = "github.com/Coalfire-CF/terraform-<PROVIDER>-X-X?ref=vX.X.X"
  name                       = "${replace(var.resource_prefix, "-", "")}tfstatesa"
  resource_group_name        = azurerm_resource_group.management.name
  location                   = var.location
}
```


<!-- BEGIN_TF_DOCS -->

ALLOW TERRAFORM MARKDOWN GITHUB ACTION TO POPULATE THE BELOW

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|

## Modules

| Name | Source | Version |
|------|--------|---------|

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|

## Outputs

| Name | Description |
|------|-------------|

<!-- END_TF_DOCS -->

## Contributing

[Start Here](CONTRIBUTING.md)

## License

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/license/mit/)

## Contact Us

[Coalfire](https://coalfire.com/)

### Copyright

Copyright © 2023 Coalfire Systems Inc.
