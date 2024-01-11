region        = "us-east-1"
bucket_name   = "test"
dynamodb_name = "test"
environment   = "dev"

ssm_parameter_db_username = "/HIS-WL/DEV/aurora/cluster_admin_db_username"
connect_timeout           = 15
ssm_parameter_db_password = "/HIS-WL/DEV/aurora/cluster_admin_db_password"
ssm_parameter_db_endpoint = "/HIS-WL/DEV/aurora/cluster_endpoint"

pg_db = {
  "example_db" = {
    db_name           = "example_db"
    db_owner          = "example_role"
    template          = "template0"
    lc_collate        = "C"
    connection_limit  = -1
    allow_connections = true
  }
}

pg_previleges = {
  "test" = {
    role        = "example_role"
    database    = "example_db"
    schema      = "public"
    owner       = "example_role"
    object_type = "table"
    privileges  = ["ALL"]
  }
}

pg_schema = {
  "test" = {
    schema_name = "test"
  }
}
