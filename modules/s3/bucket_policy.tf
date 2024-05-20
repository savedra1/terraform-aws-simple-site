data "aws_iam_policy_document" "allow_public_read" {
  depends_on = [
    aws_s3_bucket.static_site_bucket
  ]
  statement {
    sid       = "AllowCloudFrontServicePrincipalReadOnly"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.static_site_bucket.bucket}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [var.source_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  depends_on = [
    aws_s3_bucket.static_site_bucket,
  ]
  bucket = aws_s3_bucket.static_site_bucket.id
  policy = data.aws_iam_policy_document.allow_public_read.json
}

