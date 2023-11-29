terraform {
  required_version = "~> 1.4"

  required_providers {
    postgresql = {
      version = "~> 1.21"
      source  = "cyrilgdn/postgresql"
    }
    aws = {
      version = "~> 5.0"
      source  = "hashicorp/aws"
    }
    random = {
      version = "~> 3.0"
      source  = "hashicorp/random"
    }
  }

  #backend "s3" {}
}

provider "aws" {
  region = var.region
}

provider "postgresql" {
  host            = data.aws_ssm_parameter.db_endpoint.value
  port            = var.port
  database        = var.database
  superuser       = var.superuser
  username        = data.aws_ssm_parameter.db_username.value
  password        = data.aws_ssm_parameter.db_password.value
  sslmode         = var.sslmode
  connect_timeout = var.connect_timeout
}

resource "random_password" "password" {
  for_each = local.pg_random_passwords
  length   = each.value.length
  special  = each.value.special
}

module "postgresql" {
  source                        = "sourcefuse/arc-postgresql-mgmt/aws"
  version                       = "0.0.3"
  pg_roles                      = local.pg_roles
  postgresql_database           = var.pg_db
  postgresql_default_privileges = var.pg_previleges
  postgresql_schema             = var.pg_schema
  pg_ssm_parameters             = local.pg_ssm_parameters
}
