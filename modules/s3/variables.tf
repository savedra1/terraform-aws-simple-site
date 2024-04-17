variable "site_bucket_name" {}
variable "object_directory" {
  type        = string
  description = "The path for where the files are stored for your S3 bucket. All files in this directory will be uploaded."
  default = "./"
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
variable "logging_enabled" {}