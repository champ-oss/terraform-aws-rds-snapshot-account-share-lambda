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


## Modules

No modules.

## Resources

## Inputs



## Outputs


<!-- END_TF_DOCS -->


## Project Status
Project is: _in_progress_ 