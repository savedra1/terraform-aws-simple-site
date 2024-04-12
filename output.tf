
output "cloudfront_endpoint" {
  value = module.cloudfront_without_domain[0].cloudfront_endpoint[0] ? var.domain_name != "" : module.cloudfront_with_domain[0].cloudfront_endpoint[0]
}
