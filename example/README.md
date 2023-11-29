# [terraform-postgresql-aws-arc-mgmt](https://github.com/sourcefuse/terraform-postgresql-aws-arc-mgmt)

[![snyk](https://github.com/sourcefuse/terraform-postgresql-aws-arc-mgmt/actions/workflows/snyk.yaml/badge.svg)](https://github.com/sourcefuse/terraform-postgresql-aws-arc-mgmt/actions/workflows/snyk.yaml)

## Overview

It demonstrates how to create and manage a PostgreSQL database, roles, schemas, and associated resources on AWS.

## Usage
  ```
required_providers {
    postgresql = {
      version = "~> 1.21"
      source  = "cyrilgdn/postgresql"
    }
    aws = {
      version = "~> 5.0"
      source  = "hashicorp/aws"
    }
    random = {
      version = "~> 3.0"
      source  = "hashicorp/random"
    }
  }
  ```
1. Initialize Terraform with the backend config
  ```shell
  terraform init -backend-config=config.dev.hcl
  ```
2. Plan Terraform
  ```shell
  terraform plan -var-file .\tfvars\dev.tfvars
  ```
3. Apply Terraform
  ```shell
  terraform apply -var-file .\tfvars\dev.tfvars
  ```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | ~> 1.21 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.28.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_postgresql"></a> [postgresql](#module\_postgresql) | sourcefuse/arc-postgresql-mgmt/aws | 0.0.3 |

## Resources

| Name | Type |
|------|------|
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_ssm_parameter.db_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.db_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.db_username](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connect_timeout"></a> [connect\_timeout](#input\_connect\_timeout) | connection timeout of the database | `number` | n/a | yes |
| <a name="input_database"></a> [database](#input\_database) | Name of the database | `string` | `"postgres"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | n/a | yes |
| <a name="input_pg_db"></a> [pg\_db](#input\_pg\_db) | configuration block for postgresql database | <pre>map(object({<br>    db_name           = string<br>    db_owner          = string<br>    template          = optional(string, null)<br>    lc_collate        = optional(string, null)<br>    connection_limit  = optional(string, null)<br>    allow_connections = optional(string, null)<br>  }))</pre> | n/a | yes |
| <a name="input_pg_previleges"></a> [pg\_previleges](#input\_pg\_previleges) | configuration block for postgresql default privileges | <pre>map(object({<br>    role        = string<br>    database    = string<br>    schema      = string<br>    owner       = string<br>    object_type = string<br>    privileges  = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_pg_schema"></a> [pg\_schema](#input\_pg\_schema) | configuration block for postgresql schema | <pre>map(object({<br>    schema_name   = string<br>    schema_owner  = optional(string, null)<br>    database      = optional(string, null)<br>    if_not_exists = optional(string, null)<br>    drop_cascade  = optional(string, null)<br><br>    policy = optional(list(object({<br>      usage = optional(string, null)<br>      role  = optional(string, null)<br>    })), [])<br>  }))</pre> | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Database port | `number` | `5432` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_sslmode"></a> [sslmode](#input\_sslmode) | sslmode of the database | `string` | `"require"` | no |
| <a name="input_ssm_parameter_db_endpoint"></a> [ssm\_parameter\_db\_endpoint](#input\_ssm\_parameter\_db\_endpoint) | SSM parameter to fetch the database endpoint | `string` | n/a | yes |
| <a name="input_ssm_parameter_db_password"></a> [ssm\_parameter\_db\_password](#input\_ssm\_parameter\_db\_password) | SSM parameter name to fetch db password | `string` | n/a | yes |
| <a name="input_ssm_parameter_db_username"></a> [ssm\_parameter\_db\_username](#input\_ssm\_parameter\_db\_username) | SSM parameter to fetch db user name | `string` | n/a | yes |
| <a name="input_superuser"></a> [superuser](#input\_superuser) | Defines whether the role is a superuser, and therefore can override all access restrictions within the database | `string` | `false` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
