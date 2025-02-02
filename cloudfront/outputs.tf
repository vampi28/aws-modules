output "cloudfront_domain_name" {
  description = "Nombre de dominio de la distribución de CloudFront."
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_distribution_id" {
  description = "ID de la distribución de CloudFront."
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_distribution_arn" {
  description = "ARN de la distribución de CloudFront."
  value       = aws_cloudfront_distribution.s3_distribution.arn
}

output "cloudfront_oai_arn" {
  value = aws_cloudfront_origin_access_identity.oai.iam_arn
}

# output "cloudfront_oai_id" {
#   value = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
# }