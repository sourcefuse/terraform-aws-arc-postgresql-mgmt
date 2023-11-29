region        = ""
bucket_name   = ""
dynamodb_name = ""
project_name  = ""
environment   = ""

ssm_parameter_db_username = ""
ssm_parameter_db_username = ""
connect_timeout           =
ssm_parameter_db_password = ""

pg_db = {
  "test" = {
    db_name           = "test"
    db_owner          = ""
    template          = ""
    lc_collate        = ""
    connection_limit  = -1
    allow_connections = true
  }
}

pg_previleges = {
  "test" = {
    role        = "test"
    database    = ""
    schema      = ""
    owner       = ""
    object_type = "table"
    privileges  = []
  }
}

pg_schema = {
  "test" = {
    schema_name = ""
  }
}
