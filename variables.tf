variable "pg_roles" {
  type = map(object({
    name     = string
    login    = string
    password = string
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
    name  = string
    type  = string
    value = string
  }))
}

variable "database" {
  type        = string
  description = "Name of the database"
  default     = "postgres"
}

variable "sslmode" {
  type        = string
  description = "sslmode of the database"
  default     = "require"
}

variable "connect_timeout" {
  type        = number
  description = "connection timeout of the database"
}

variable "ssm_parameter_db_password" {
  type        = string
  description = "SSM parameter name to fetch db password"
}

variable "ssm_parameter_db_username" {
  type        = string
  description = "SSM parameter to fetch db user name"
}

variable "db_instance_identifier" {
  type        = string
  description = "DB instance identifier of RDS"
}