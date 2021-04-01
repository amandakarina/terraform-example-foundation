<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| folder\_prefix | Name prefix to use for folders created. | `string` | `"fldr"` | no |
| num\_instances | Optional - quantity of compute instances to be created. | `number` | `1` | no |
| org\_id | The organization id for the associated services | `string` | n/a | yes |
| parent\_folder | Optional - if using a folder for testing. | `string` | `""` | no |
| static\_ips | List of static IPs for VM instances | `list(string)` | `[]` | no |
| terraform\_service\_account | Service account email of the account to impersonate to run Terraform | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| available\_zones | List of available zones in region |
| instances\_details | List of details for compute instances |
| instances\_names | List of names for compute instances |
| instances\_self\_links | List of self-links for compute instances |
| project\_id | Project where compute instance was created |
| region | Region where compute instance was created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
