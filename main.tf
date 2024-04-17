
# Certificate manager
module "acm" {
  count       = var.domain_name != "" ? 1 : 0
  source      = "./modules/acm"
  domain_name = var.domain_name
  cert_record = module.route53[0].cert_record[0]
  providers = {
    aws = aws.acm_provider
  }
}

# AWS Cloudfront
module "cloudfront_with_domain" {
  count = var.domain_name != "" ? 1 : 0
  depends_on = [
    module.acm.domain_validation_options,
    module.acm.cert_arn,
    module.route53.cert_record
  ]
  source          = "./modules/cloudfront_custom"
  domain_name     = var.domain_name
  cert_id         = module.acm[0].cert_arn[0]
  regional_domain = module.s3.regional_domain
  origin_id       = module.s3.origin_id
  log_bucket_name = module.s3.log_bucket_name
}

# Route53
module "route53" {
  count = var.domain_name != "" ? 1 : 0
  depends_on = [
    module.acm.domain_validation_options,
    module.acm.cert_arn
  ]
  auto_renew                = var.domain_auto_renew
  source                    = "./modules/route53"
  domain_name               = var.domain_name
  region                    = var.domain_name
  bucket_zone_id            = module.s3.bucket_zone_id
  cloudfront_endpoint       = module.cloudfront_with_domain[0].cloudfront_endpoint[0]
  cloudfront_zone_id        = module.cloudfront_with_domain[0].cloudfront_zone_id[0]
  domain_validation_options = module.acm[0].domain_validation_options[0]
}

# AWS Cloudfront
module "cloudfront_without_domain" {
  count           = var.domain_name != "" ? 0 : 1
  source          = "./modules/cloudfront_raw"
  regional_domain = module.s3.regional_domain
  origin_id       = module.s3.origin_id
}

# Site bucket
module "s3" {
  source           = "./modules/s3"
  site_bucket_name = var.site_bucket
  object_directory = var.object_directory
  logging_enabled = var.enable_logging
}

