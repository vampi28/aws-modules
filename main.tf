provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}


module "s3_bucket" {
  source        = "./terraform-s3-module"
  bucket_name   = "my-dynamic-bucket"
  force_destroy = true

  tags = {
    Environment = "Production"
    Project     = "Dynamic-Tags"
    Owner       = "Diego"
    Team        = "DevOps"
  }
}
