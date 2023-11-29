variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
}

variable "environment" {
  type        = string
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

# variable "random_password" {
#   type = map(object({
#     length  = string
#     special = bool
#   }))
#   description = "To generate random password for DB role"
# }

variable "database" {
  type        = string
  description = "Name of the database"
  default     = "postgres"
}

variable "port" {
  type        = number
  description = "Database port"
  default     = 5432
}

variable "superuser" {
  type        = string
  description = "Defines whether the role is a superuser, and therefore can override all access restrictions within the database"
  default     = false
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

variable "ssm_parameter_db_endpoint" {
  type        = string
  description = "SSM parameter to fetch the database endpoint"
}

variable "pg_db" {
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

variable "pg_previleges" {
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

variable "pg_schema" {
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
