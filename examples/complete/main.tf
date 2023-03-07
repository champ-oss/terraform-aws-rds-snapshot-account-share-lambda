provider "aws" {
  region = "us-east-2"
}

locals {
  git = "terraform-rds-util"
}

module "vpc" {
  source                   = "github.com/champ-oss/terraform-aws-vpc.git?ref=v1.0.46-da2e05d"
  name                     = local.git
  availability_zones_count = 2
  retention_in_days        = 1
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "rds:CopyDBSnapshot",
      "rds:ModifyDBSnapshot",
      "rds:DescribeDBSnapshots",
      "rds:DescribeDBInstances",
      "rds:ListTagsForResource",
      "rds:AddTagsToResource",
      "rds:DeleteDBSnapshot",
      "rds:ModifyDBSnapshotAttribute"
    ]
    resources = ["*"]
  }
}

module "this" {
  source             = "../../"
  private_subnet_ids = module.vpc.private_subnets_ids
  vpc_id             = module.vpc.vpc_id
  lambda_policy      = data.aws_iam_policy_document.this.json
}
