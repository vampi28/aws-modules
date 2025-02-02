output "web_acl_arn" {
  description = "ARN del Web ACL"
  value       = aws_wafv2_web_acl.geo_restriction.arn
}