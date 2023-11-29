data "aws_ssm_parameter" "db_password" {
  name = var.ssm_parameter_db_password
}

data "aws_ssm_parameter" "db_username" {
  name = var.ssm_parameter_db_username
}

data "aws_ssm_parameter" "db_endpoint" {
  name = var.ssm_parameter_db_endpoint
}