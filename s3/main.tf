resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags          = { for key, value in var.tags : key => value }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.aws_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}