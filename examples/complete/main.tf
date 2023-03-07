provider "aws" {
  region = "us-east-2"
}

data "aws_vpcs" "this" {
  tags = {
    purpose = "vega"
  }
}

data "aws_subnets" "private" {
  tags = {
    purpose = "vega"
    Type    = "Private"
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.this.ids[0]]
  }
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
  private_subnet_ids = data.aws_subnets.private.ids
  vpc_id             = data.aws_vpcs.this.ids[0]
  lambda_policy      = data.aws_iam_policy_document.this.json
}
