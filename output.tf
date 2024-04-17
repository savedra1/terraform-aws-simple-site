
output "cloudfront_endpoint" {
  value = var.domain_name != "" ? module.cloudfront_with_domain[0].cloudfront_endpoint[0] : module.cloudfront_without_domain[0].cloudfront_endpoint[0]
}

output "custom_endpoint" {
  value = var.domain_name == "" ? "n/a" : var.domain_name
}