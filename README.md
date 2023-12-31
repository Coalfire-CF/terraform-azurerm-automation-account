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


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_automation_account.aa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name) | Name of the Automation Account | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Global level tags | `map(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location/region to create resources in. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID of the Log Analytics Workspace diagnostic logs should be sent to | `string` | n/a | yes |
| <a name="input_regional_tags"></a> [regional\_tags](#input\_regional\_tags) | Regional level tags | `map(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group of Automation Account | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aa_dsc_endpoint"></a> [aa\_dsc\_endpoint](#output\_aa\_dsc\_endpoint) | n/a |
| <a name="output_aa_id"></a> [aa\_id](#output\_aa\_id) | n/a |
| <a name="output_aa_name"></a> [aa\_name](#output\_aa\_name) | n/a |
| <a name="output_aa_primary_registration_key"></a> [aa\_primary\_registration\_key](#output\_aa\_primary\_registration\_key) | n/a |
| <a name="output_aa_principal_id"></a> [aa\_principal\_id](#output\_aa\_principal\_id) | n/a |
<!-- END_TF_DOCS -->

## Contributing

[Start Here](CONTRIBUTING.md)

## License

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/license/mit/)

## Contact Us

[Coalfire](https://coalfire.com/)

### Copyright

Copyright © 2023 Coalfire Systems Inc.
