locals {
  use_localstack = true
}

generate "provider" {
  path      = "generated.providers.tf"
  if_exists = "overwrite_terragrunt"
  contents = local.use_localstack ? "${<<-EOF
    provider "aws" {
      access_key                  = "test"
      secret_key                  = "test"
      region                      = "us-east-1"
      s3_use_path_style           = false
      skip_credentials_validation = true
      skip_metadata_api_check     = true
      skip_requesting_account_id  = true

      endpoints {
        apigateway     = "http://localhost:4566"
        dynamodb       = "http://localhost:4566"
        iam            = "http://localhost:4566"
        kinesis        = "http://localhost:4566"
        lambda         = "http://localhost:4566"
        s3             = "http://s3.localhost.localstack.cloud:4566"
        ses            = "http://localhost:4566"
        sns            = "http://localhost:4566"
        sqs            = "http://localhost:4566"
        sts            = "http://localhost:4566"
      }
    }
  EOF
  }" : <<-EOF
    provider "aws" {
      region = "us-east-1"
    }
  EOF
}