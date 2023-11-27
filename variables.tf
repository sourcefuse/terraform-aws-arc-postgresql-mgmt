variable "pg_roles" {
  type = map(object({
    postgres_role_name = string
    login              = string
    password           = string
  }))
}

variable "postgresql_database" {
  type = map(object({
    db_name           = string
    db_owner          = string
    template          = optional(string, null)
    lc_collate        = optional(string, null)
    connection_limit  = optional(string, null)
    allow_connections = optional(string, null)
  }))
  description = "configuration block for postgresql database"
}

variable "postgresql_default_privileges" {
  type = map(object({
    role        = string
    database    = string
    schema      = string
    owner       = string
    object_type = string
    privileges  = list(string)
  }))
  description = "configuration block for postgresql default privileges"
}

variable "postgresql_schema" {
  type = map(object({
    schema_name   = string
    schema_owner  = optional(string, null)
    database      = optional(string, null)
    if_not_exists = optional(string, null)
    drop_cascade  = optional(string, null)

    policy = optional(list(object({
      usage = optional(string, null)
      role  = optional(string, null)
    })), [])
  }))
  description = "configuration block for postgresql schema"
}

variable "pg_ssm_parameters" {
  type = map(object({
    name     = string
    type     = string
    password = string
  }))
}
