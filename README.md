# terraform-aws-mongodb-ec2

[![open-issues](https://img.shields.io/github/issues-raw/insight-infrastructure/terraform-aws-mongodb-ec2?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-mongodb-ec2/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-infrastructure/terraform-aws-mongodb-ec2?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-mongodb-ec2/pulls)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```
module "this" {
    source = "github.com/insight-infrastructure/terraform-aws-mongodb-ec2"

}
```
## Examples

- [defaults](https://github.com/insight-infrastructure/terraform-aws-mongodb-ec2/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| create\_efs | Boolean to create EFS file system | `bool` | `true` | no |
| id | The id to give to rds db, falls back to name | `string` | `""` | no |
| instance\_type | Instance type | `string` | `"t2.medium"` | no |
| key\_name | The key pair to import | `string` | `""` | no |
| name | A unique name to give all the resources | `string` | `"superset"` | no |
| playbook\_vars | Extra vars to include, can be hcl or json | `any` | `{}` | no |
| playbook\_vars\_file | json or yaml to run | `string` | `""` | no |
| private\_key\_path | The path to the private ssh key | `string` | n/a | yes |
| public\_key\_path | The path to the public ssh key | `string` | n/a | yes |
| root\_volume\_size | Root volume size | `string` | `8` | no |
| subnet\_ids | The id of the subnet | `list(string)` | n/a | yes |
| tags | Tags to attach to all resources | `map(string)` | `{}` | no |
| vpc\_id | The vpc to deploy into | `string` | n/a | yes |
| vpc\_security\_group\_ids | List of security groups | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | The instance ID created |
| key\_name | The key pair name created |
| public\_ip | The public IP of the instance created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [insight-infrastructure](https://github.com/insight-infrastructure)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.