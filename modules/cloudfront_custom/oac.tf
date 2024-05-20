resource "aws_cloudfront_origin_access_control" "oac" { 
  name                              = var.regional_domain
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "never"
  signing_protocol                  = "sigv4"
}