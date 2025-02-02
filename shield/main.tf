resource "aws_shield_protection" "aws_shield" {
  name         = var.name
  resource_arn = var.resource_arn
}