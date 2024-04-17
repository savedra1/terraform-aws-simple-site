resource "aws_s3_bucket" "log_bucket" {
    count = var.logging_enabled ? 1 : 0
    bucket = "logs-${var.site_bucket_name}"
}

resource "aws_s3_bucket_ownership_controls" "log_bucket_ownership" {
  bucket = aws_s3_bucket.log_bucket[0].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.log_bucket_ownership]

  bucket = aws_s3_bucket.log_bucket[0].id
  acl    = "private"
}