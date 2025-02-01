output "bucket_arn" {
  description = "El ARN del bucket S3 creado."
  value       = aws_s3_bucket.aws_s3_bucket.arn
}
