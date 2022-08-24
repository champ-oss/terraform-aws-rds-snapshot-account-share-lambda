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

resource "aws_iam_policy" "this" {
  name_prefix = var.git
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = module.rds_snapshot_account_share_lambda.role_name
}
