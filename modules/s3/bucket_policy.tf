
data "aws_iam_policy_document" "allow_public_read" {
  depends_on = [
    aws_s3_bucket.static_website, 
    aws_s3_bucket_public_access_block.static_website_public_access_block,
    aws_s3_bucket_website_configuration.website_config
  ]
  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = [
      aws_s3_bucket.static_website.arn,  
      "${aws_s3_bucket.static_website.arn}/*"
    ]

    principals {
      identifiers = [aws_s3_bucket.static_website.id]
      type        = "*"
    }
  }
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  depends_on = [
    aws_s3_bucket.static_website, 
    aws_s3_bucket_public_access_block.static_website_public_access_block,
    aws_s3_bucket_website_configuration.website_config
  ]
  bucket = aws_s3_bucket.static_website.id
  policy = data.aws_iam_policy_document.allow_public_read.json
}
