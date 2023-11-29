region        = "us-east-1"
bucket_name   = "test"
dynamodb_name = "test"
environment   = "dev"

ssm_parameter_db_username = "example"
connect_timeout           = 15
ssm_parameter_db_password = "example"
ssm_parameter_db_endpoint = "example"

pg_db = {
  "test" = {
    db_name           = "test"
    db_owner          = "example"
    template          = "template0"
    lc_collate        = "C"
    connection_limit  = -1
    allow_connections = true
  }
}

pg_previleges = {
  "test" = {
    role        = "test"
    database    = "example"
    schema      = "example"
    owner       = "example"
    object_type = "table"
    privileges  = []
  }
}

pg_schema = {
  "test" = {
    schema_name = "test"
  }
}
