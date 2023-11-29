################################################################################
## defaults
################################################################################
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
  }
}

resource "postgresql_role" "pg_role" {
  for_each = var.pg_roles
  name     = each.value.postgres_role_name
  login    = each.value.login
  password = each.value.password
}

resource "postgresql_database" "pg_db" {
  for_each          = var.postgresql_database
  name              = each.value.db_name
  owner             = each.value.db_owner
  template          = each.value.template
  lc_collate        = each.value.lc_collate
  connection_limit  = each.value.connection_limit
  allow_connections = each.value.allow_connections
  depends_on = [
    postgresql_role.pg_role
  ]
}

resource "postgresql_default_privileges" "pg_default_privileges" {
  for_each    = var.postgresql_default_privileges
  role        = each.value.role
  database    = each.value.database
  schema      = each.value.schema
  owner       = each.value.owner
  object_type = each.value.object_type
  privileges  = each.value.privileges

  depends_on = [
    postgresql_database.pg_db,
    postgresql_role.pg_role,
    postgresql_schema.pg_schema
  ]
}

resource "postgresql_schema" "pg_schema" {
  for_each      = var.postgresql_schema
  name          = each.value.schema_name
  owner         = each.value.schema_owner
  database      = each.value.database
  if_not_exists = each.value.if_not_exists
  drop_cascade  = each.value.drop_cascade

  dynamic "policy" {
    for_each = each.value.policy
    content {
      usage = lookup(policy.value, "usage", null)
      role  = lookup(policy.value, "role", null)
    }
  }
}

#### SSM parameters
resource "aws_ssm_parameter" "this" {
  for_each = var.pg_ssm_parameters
  name     = each.value.name
  type     = each.value.type
  value    = each.value.password
}
