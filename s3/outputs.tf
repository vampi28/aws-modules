output "bucket_arn" {
  description = "El ARN del bucket S3 creado."
  value       = aws_s3_bucket.aws_s3_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.aws_s3_bucket.bucket
}

output "bucket_id" {
  value = aws_s3_bucket.aws_s3_bucket.id
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.aws_s3_bucket.bucket_regional_domain_name
}