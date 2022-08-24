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
- deploy lambda python function used to copy latest snapshot from rds database and share with aws account

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
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rds_snapshot_account_share_lambda"></a> [rds\_snapshot\_account\_share\_lambda](#module\_rds\_snapshot\_account\_share\_lambda) | github.com/champ-oss/terraform-aws-lambda.git | v1.0.71-2e2e648 |

## Resources

| Name | Type |
|------|------|
| [random_string.identifier](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_shared_account"></a> [aws\_shared\_account](#input\_aws\_shared\_account) | snapshot aws account share | `string` | `""` | no |
| <a name="input_enable_lambda_cw_event"></a> [enable\_lambda\_cw\_event](#input\_enable\_lambda\_cw\_event) | enable or disable cloudwatch event trigger for lambda | `bool` | `true` | no |
| <a name="input_git"></a> [git](#input\_git) | Name of the Git repo | `string` | `"terraform-aws-mysql"` | no |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group#subnet_ids | `list(string)` | n/a | yes |
| <a name="input_rds_snapshot_account_share_docker_tag"></a> [rds\_snapshot\_account\_share\_docker\_tag](#input\_rds\_snapshot\_account\_share\_docker\_tag) | Docker tag of rds snapshot share code to deploy | `string` | `"295b9fed2aa4953d7f4dca988bd5c609fe30e468"` | no |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | event schedule for lambda | `string` | `"cron(0 17, 18, 19, 20 ? * * *)"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->


## Project Status
Project is: _in_progress_ 