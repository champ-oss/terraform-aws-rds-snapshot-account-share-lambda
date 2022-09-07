provider "aws" {
  region = "us-east-2"
}

locals {
  git = "terraform-rds-util"
}

module "vpc" {
  source                   = "github.com/champ-oss/terraform-aws-vpc.git?ref=v1.0.35-1462786"
  git                      = local.git
  availability_zones_count = 2
  retention_in_days        = 1
}

module "this" {
  source             = "../../"
  private_subnet_ids = module.vpc.private_subnets_ids
  vpc_id             = module.vpc.vpc_id
}
