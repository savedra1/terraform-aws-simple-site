
# Certificate manager
module "acm" {
  count = var.DOMAIN_NAME != "" ? 1 : 0
  source      = "./modules/acm"
  domain_name = var.DOMAIN_NAME
  cert_record = module.route53.cert_record
  providers = {
    aws = aws.acm_provider
  }
}

# AWS Cloudfront
module "cloudfront_with_domain" {
  count = var.DOMAIN_NAME != "" ? 1 : 0
  source          = "./modules/cloudfront_custom"
  domain_name     = var.DOMAIN_NAME
  cert_id =  module.acm[*].cert_id
  regional_domain = module.s3.regional_domain
  origin_id       = module.s3.origin_id
}

# AWS Cloudfront
module "cloudfront_without_domain" {
  count           = var.DOMAIN_NAME != "" ? 0 : 1
  source          = "./modules/cloudfront_raw"
  regional_domain = module.s3.regional_domain
  origin_id       = module.s3.origin_id
}

# Route53
module "route53" {
  count = var.DOMAIN_NAME != "" ? 1 : 0

  source                    = "./modules/route53"
  domain_name               = var.DOMAIN_NAME
  region                    = var.AWS_REGION
  bucket_zone_id            = module.s3.bucket_zone_id
  cloudfront_endpoint       = module.cloudfront_with_domain.cloudfront_endpoint
  cloudfront_zone_id        = module.cloudfront_with_domain.cloudfront_zone_id
  domain_validation_options = module.acm[*].domain_validation_options
  
}

# Site bucket
module "s3" {
  source           = "./modules/s3"
  site_bucket_name = var.SITE_BUCKET
  filepath         = var.DIRECTORY
}

