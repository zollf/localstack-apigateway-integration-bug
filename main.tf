locals {
  region = "ap-southeast-2"
}

provider "aws" {
  region     = "ap-southeast-2"
  access_key = "fake_access_key"
  secret_key = "fake_secret_key"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway       = "http://localhost:4566"
    cloudwatch       = "http://localhost:4566"
    cloudwatchlogs   = "http://localhost:4566"
    cloudwatchevents = "http://localhost:4566"
    s3               = "http://localhost:4566"
    lambda           = "http://localhost:4566"
    sts              = "http://localhost:4566"
    iam              = "http://localhost:4566"
    kms              = "http://localhost:4566"
  }
}

terraform {
  required_version = ">= 1.5"
}
