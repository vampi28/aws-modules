terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "s3_bucket_1" {
  source        = "./terraform-s3-module"
  bucket_name   = "my-dynamic-bucket-diego-28"
  force_destroy = true

  tags = {
    Environment = "DEV"
    Project     = "Dynamic-Tags"
    Owner       = "Diego"
    Team        = "DevOps"
  }
}


module "s3_bucket_2" {
  source        = "./terraform-s3-module"
  bucket_name   = "my-dynamic-bucket-diego-29"
  force_destroy = true

  tags = {
    Environment = "DEV"
    Project     = "Dynamic-Tags"
    Owner       = "Diego"
    Team        = "DevOps"
  }
}