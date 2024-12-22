terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}


module "s3_bucket" {
  source        = "./terraform-s3-module"
  bucket_name   = "my-dynamic-bucket"
  force_destroy = true

  tags = {
    Environment = "LocalStack"
    Project     = "Dynamic-Tags"
    Owner       = "Diego"
    Team        = "DevOps"
  }
}
