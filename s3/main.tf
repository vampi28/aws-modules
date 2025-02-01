resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags = { for key, value in var.tags : key => value }
}
