module "rds_snapshot_account_share_lambda" {
  source              = "github.com/champ-oss/terraform-aws-lambda.git?ref=v1.0.147-dd45619"
  git                 = var.git
  name                = "rds-snapshot-account-share-${random_string.identifier.result}"
  tags                = merge(local.tags, var.tags)
  description         = "rds-snapshot-account-share lambda function"
  enable_cw_event     = var.enable_lambda_cw_event
  schedule_expression = var.schedule_expression
  enable_vpc          = true
  private_subnet_ids  = var.private_subnet_ids
  sync_image          = true
  sync_source_repo    = "champtitles/rds-snapshot-account-share"
  ecr_name            = "rds-snapshot-account-share-${random_string.identifier.result}"
  ecr_tag             = var.rds_snapshot_account_share_docker_tag
  timeout             = var.timeout
  vpc_id              = var.vpc_id # eni delete resource bug https://github.com/hashicorp/terraform-provider-aws/issues/10329
  environment = {
    AWS_SHARED_ACCOUNT = var.aws_shared_account # aws account to share snapshot with
    KMS_KEY_ID         = var.kms_key_id
  }
}
