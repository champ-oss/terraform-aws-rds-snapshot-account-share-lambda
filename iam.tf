resource "aws_iam_policy" "this" {
  name_prefix = var.git
  policy      = var.lambda_policy
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = module.rds_snapshot_account_share_lambda.role_name
}
