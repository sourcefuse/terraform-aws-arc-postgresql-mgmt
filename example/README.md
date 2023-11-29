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
