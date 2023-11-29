locals {
  pg_roles            = local.env_pg_roles[var.environment]
  pg_ssm_parameters   = local.env_pg_ssm_parameters[var.environment]
  pg_random_passwords = local.env_pg_random_passwords[var.environment]

  env_pg_roles = {
    dev = {
      "test" = {
        postgres_role_name = "test"
        login              = true
        password           = resource.random_password.password["example_random_password"].result
      }
    }
  }

  env_pg_random_passwords = {
    dev = {
      "example_random_password" = {
        length        = "32"
        special       = true
        special_lower = "@#$"
      }
    }
  }

  env_pg_ssm_parameters = {
    dev = {
      "example1" = {
        name     = "example1"
        type     = "SecureString"
        password = resource.random_password.password["example_random_password"].result
      }
    }
  }
}
