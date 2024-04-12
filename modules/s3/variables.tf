variable "site_bucket_name" {}


variable "object_directory" {
  type        = string
  description = "The path for where the files are stored for your S3 bucket. All files in this directory will be uploaded."
  default = "./"
}