resource "aws_acm_certificate" "cert" {
  domain_name       = "*.<YOUR_DOMAIN>.com"
  validation_method = "DNS"
}
