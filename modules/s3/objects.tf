resource "aws_s3_object" "bucket_objects" {
  for_each     = fileset(var.object_directory, "*")
  bucket       = aws_s3_bucket.static_site_bucket.id
  key          = basename(each.value)
  source       = "${var.object_directory}/${each.value}"
  etag         = filemd5("${var.object_directory}/${each.value}")
  content_type = try(var.content_types[split(".", each.value)[1]], "application/octet-stream")
}


