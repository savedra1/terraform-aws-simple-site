
variable "content_types" {
  type = map(string)
  default = {
    "html" = "text/html"
    "css"  = "text/css"
    "js"   = "application/javascript"
    "pdf"  = "application/pdf"
    "json" = "application/json"
    # Any other file extensions will default to "application/octet-stream"
  }
}

resource "aws_s3_object" "bucket_objects" {
  for_each     = fileset(var.files_directory, "*")
  bucket       = aws_s3_bucket.test_bucket.id
  key          = basename(each.value)
  source       = "${var.files_directory}/${each.value}"
  etag         = filemd5("${var.files_directory}/${each.value}")
  content_type = try(var.content_types[split(".", each.value)[1]], "application/octet-stream")
}


