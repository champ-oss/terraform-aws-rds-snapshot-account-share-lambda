variable "private_subnet_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group#subnet_ids"
  type        = list(string)
}

variable "vpc_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id"
  type        = string
}

variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-mysql"
}

variable "enable_lambda_cw_event" {
  description = "enable or disable cloudwatch event trigger for lambda"
  default     = true
  type        = bool
}

variable "schedule_expression" {
  description = "event schedule for lambda"
  type        = string
  default     = "cron(0 17,18,19,20 * * ? *)" # lambda executes every day, hourly from 5 - 8 pm UTC
}

variable "rds_snapshot_account_share_docker_tag" {
  description = "Docker tag of rds snapshot share code to deploy"
  type        = string
  default     = "295b9fed2aa4953d7f4dca988bd5c609fe30e468"
}

variable "aws_shared_account" {
  description = "snapshot aws account share"
  type        = string
  default     = ""
}
