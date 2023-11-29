region        = "us-east-1"
bucket_name   = "test"
dynamodb_name = "test"
project_name  = "example"
namespace     = "example"
environment   = "env"

ssm_parameter_db_username = "example"
connect_timeout           = "15s"
ssm_parameter_db_password = "example"

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
