
variable "files_directory" {
  type    = string
  default = "./objects" # Default directory path
}

variable "index_file_name" {
  type        = string
  default     = "index.html"
  description = "The file name for the index document of the static site."
}

variable "error_file_name" {
  type        = string
  default     = "error.html"
  description = "The file name for the error document of the static site."
}

variable "domain_name" {
  type    = string
  default = ""
}

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


###### S3 #########
###################

resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-for-loop-objects-2213"
}

resource "aws_s3_bucket_public_access_block" "test_bucket_access_block" {
  bucket                  = aws_s3_bucket.test_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.test_bucket.id

  index_document {
    suffix = var.index_file_name
  }

  error_document {
    key = var.index_file_name
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

####### ACM #########
#####################

resource "aws_acm_certificate" "domain_cert" {
  count             = var.domain_name != "" ? 1 : 0 # only apply this resource if a domain name is provided
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

####### Outputs #####
#####################

output "total_files" {
  #value = length(local.files_map)
  value = length(fileset(var.files_directory, "*"))
}

output "file_names" {
  #value = keys(local.files_map)
  value = fileset(var.files_directory, "*")
}

