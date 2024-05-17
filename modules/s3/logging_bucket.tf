#resource "aws_s3_bucket" "log_bucket" {
#    count = var.log_bucket != "" ? 1 : 0
#    bucket = "logs-${var.site_bucket_name}"
#}
#
#resource "aws_s3_bucket_ownership_controls" "log_bucket_ownership" {
#  count = var.log_bucket != "" ? 1 : 0
#  bucket = aws_s3_bucket.log_bucket[0].id
#  rule {
#    object_ownership = "BucketOwnerPreferred"
#  }
#}
#
#resource "aws_s3_bucket_acl" "log_bucket_acl" {
#  count = var.log_bucket != "" ? 1 : 0
#  bucket = aws_s3_bucket.log_bucket[0].id
#  acl    = "private"
#}