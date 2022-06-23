# PBS TF dynamodb module

## Installation

### Using the Repo Source

```hcl
module "dynamodb" {
    source = "github.com/pbs/terraform-aws-dynamodb-module?ref=x.y.z"
}
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

This module provisions a DynamoDB table. The table will be configured to auto-scale by default, however there are manual scaling parameters that can be used as well, if desired.

It also supports global secondary indices through the `global_secondary_indices` parameter.

There is a `ttl` parameter available that configures TTL for the table. Specifying an attribute with this parameter sets it as the attribute that controls the TTL for that item.

Integrate this module like so:

```hcl
module "dynamodb" {
  source = "github.com/pbs/terraform-aws-dynamodb-module?ref=x.y.z"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
