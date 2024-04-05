variable "AWS_REGION" {
  type        = string
  default     = ""
  description = "The region to use for your AWS state management bucket and your site bucket in AWS S3."
}

variable "STATE_BUCKET" {
  type        = string
  default     = ""
  description = "The name of the S3 state management bucket."
}

variable "STATE_FILE" {
  type        = string
  default     = ""
  description = "The path of your state management file within your state management S3 bucket. Eg - 'prod/terraform.state'"
}

variable "SITE_BUCKET" {
  type        = string
  default     = ""
  description = "The name of the S3 bucket used for for hosting your static site. Note that if using a custom domain, the bucket should be named the same thing. Eg - name the bucket 'example.com' if that is the name of your domain."
}

variable "DOMAIN_NAME" {
  type        = string
  default     = ""
  description = "The qualified name of the domain you have registered in AWS Route53. Eg - 'example.com'. Default: ''"
}

variable "S3_OBJECTS_PATH" {
  type        = string
  default     = "./"
  description = "The path to the files used for your static site from the directory where this module will be ran. Default: './' (same as terraform dir)"
}

variable "INDEX_FILE_NAME" {
  type        = string
  default     = "index.html"
  description = "The file name for the index document of the static site. Default: 'index.html'"
}

variable "ERROR_FILE_NAME" {
  type        = string
  default     = "error.html"
  description = "The file name for the error document of the static site. Default: 'error.html'"
}

variable "AVAILABLE_LOCATIONS" {
  type        = list(string)
  default     = ["US", "CA", "GB"]
  description = "The default country codes to use for the Cloudfront distribution. Note that only EU and North American codes can be used for this price class. Default: [\"US\", \"CA\", \"GB\"]"
}




