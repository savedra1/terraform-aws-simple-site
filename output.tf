
output "website_endpoint" {
  value = module.cloudfront_without_domain[0].cloudfront_endpoint
}
