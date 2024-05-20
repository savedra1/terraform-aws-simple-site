# Create S3 bucket for hosting the static website
resource "aws_s3_bucket" "static_site_bucket" {
  bucket = var.site_bucket_name
}
