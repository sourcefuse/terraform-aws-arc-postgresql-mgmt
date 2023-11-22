data "aws_ssm_parameter" "db_password" {
  name = var.ssm_parameter_db_password
}

data "aws_ssm_parameter" "db_username" {
  name = var.ssm_parameter_db_username
}

data "aws_db_instance" "db_instance" {
  db_instance_identifier = var.db_instance_identifier
}

