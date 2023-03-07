# terraform-aws-rds-snapshot-account-share-lambda

Summary: terraform module for aws rds snapshot account share utility 

![ci](https://github.com/conventional-changelog/standard-version/workflows/ci/badge.svg)
[![version](https://img.shields.io/badge/version-1.x-yellow.svg)](https://semver.org)

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#Features)
* [Usage](#usage)
* [Requirements](#Requirements)
* [Providers](#Providers)
* [Modules](#Modules)
* [Resources](#Resources)
* [Inputs](#Inputs)
* [Outputs](#Outputs)
* [Project Status](#project-status)

## General Information
- deploy lambda python function used to copy latest snapshot from rds mysql and aurora database and share with aws account

## Technologies Used
- terraform
- github actions
- Lambda
- python

## Features

* deploy lambda python function
* rds lambda function gets latest snapshot and shares with another aws account
* iam policy required to use rds snapshot resources

## Usage

* look at examples/complete/main.tf for usage

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rds_snapshot_account_share_lambda"></a> [rds\_snapshot\_account\_share\_lambda](#module\_rds\_snapshot\_account\_share\_lambda) | github.com/champ-oss/terraform-aws-lambda.git | v1.0.96-782138d |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [random_string.identifier](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_shared_account"></a> [aws\_shared\_account](#input\_aws\_shared\_account) | snapshot aws account share | `string` | `""` | no |
| <a name="input_enable_lambda_cw_event"></a> [enable\_lambda\_cw\_event](#input\_enable\_lambda\_cw\_event) | enable or disable cloudwatch event trigger for lambda | `bool` | `true` | no |
| <a name="input_git"></a> [git](#input\_git) | Name of the Git repo | `string` | `"terraform-aws-mysql"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | kms key id | `string` | `""` | no |
| <a name="input_lambda_policy"></a> [lambda\_policy](#input\_lambda\_policy) | point to data.aws\_iam\_policy\_document.custom.json | `any` | `null` | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group#subnet_ids | `list(string)` | n/a | yes |
| <a name="input_rds_snapshot_account_share_docker_tag"></a> [rds\_snapshot\_account\_share\_docker\_tag](#input\_rds\_snapshot\_account\_share\_docker\_tag) | Docker tag of rds snapshot share code to deploy | `string` | `"928ed26a36bd0dd7c55e21b7aa9b455d8f0133e1"` | no |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | event schedule for lambda | `string` | `"cron(0 5,6,7,8 * * ? *)"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to resources | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function#timeout | `number` | `300` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->


## Project Status
Project is: _in_progress_ 