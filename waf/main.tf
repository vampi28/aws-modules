resource "aws_wafv2_web_acl" "geo_restriction" {
  name        = var.name
  description = var.description
  scope       = "REGIONAL"
  default_action {
    block {}
  }

  rule {
    name     = "geo-restriction-rule"
    priority = 1
    action {
      allow {}
    }

    statement {
      geo_match_statement {
        country_codes = var.allowed_countries
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "geoRestriction"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "geoRestrictionACL"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "alb_association" {
  resource_arn = var.resource_arn
  web_acl_arn  = aws_wafv2_web_acl.geo_restriction.arn
}
