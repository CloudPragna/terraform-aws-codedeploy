# Terraform module for AWS Code deploy

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7, < 0.14 |
| aws | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.68, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_configuration | (Optional) Configuration block of alarms associated with the deployment group | `any` | `{}` | no |
| app\_name | (Optional) The name of the application. | `string` | `""` | no |
| auto\_rollback\_configuration | (Optional) Configuration block of the automatic rollback configuration associated with the deployment group | `any` | `{}` | no |
| autoscaling\_groups | (Optional) Autoscaling groups associated with the deployment group. | `list(string)` | `[]` | no |
| blue\_green\_deployment\_config | (Optional) Configuration block of the blue/green deployment options for a deployment group | `any` | `{}` | no |
| compute\_platform | (Optional) The compute platform can either be ECS, Lambda, or Server. Default is Server. | `string` | `"Server"` | no |
| create\_app | (Optional) Do you want to create Code deploy app | `bool` | `true` | no |
| create\_deployment\_group | (Optional) Do you want create codedeploy deployment group | `bool` | `true` | no |
| deployment\_config\_name | (Optional) The name of the group's deployment config. The default is `CodeDeployDefault.OneAtATime`. | `string` | `"CodeDeployDefault.OneAtATime"` | no |
| deployment\_group\_name | (Required) The name of the deployment group. | `string` | n/a | yes |
| name | (Required) The name of the application. | `string` | n/a | yes |
| service\_role\_arn | (Required) The service role ARN that allows deployments. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
