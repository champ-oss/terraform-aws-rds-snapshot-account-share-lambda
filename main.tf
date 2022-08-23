locals {
  tags = {
    cost    = "rds"
    creator = "terraform"
    git     = var.git
  }
}

resource "random_string" "identifier" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  numeric = false
}
