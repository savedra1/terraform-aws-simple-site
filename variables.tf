
# INPUTS FOR THE MODULE

variable "aws_region" {
  type        = string
  default     = "eu-west-1"
  description = "The region to use for your AWS state management bucket and your site bucket in AWS S3."
  validation {
    condition = can(
      regex(
        "(af|il|ap|ca|eu|me|sa|us|cn|us-gov|us-iso|us-isob)-(central|north|(north(?:east|west))|south|south(?:east|west)|east|west)-\\d{1}",
        var.aws_region
      )
    )
    error_message = "MISSING INPUT FOR MODULE | You must provide a valid region for aws_region"
  }
}

variable "site_bucket" {
  type        = string
  default     = "abiwithey.co.uk"
  description = "The name of the S3 bucket used for for hosting your static site. Note that if using a custom domain, the bucket should be named the same thing. Eg - name the bucket 'example.com' if that is the name of your domain."
  validation {
    condition     = var.site_bucket != ""
    error_message = "MISSING INPUT FOR MODULE | You need to specifify the name of your S3 site bucket for 'site_bucket'"
  }
}

variable "object_directory" { # OPTIONAL
  type        = string
  default     = "./objects"
  description = "The path for where the files are stored for your S3 bucket. All files in this directory will be uploaded."
}

variable "index_file_name" { # OPTION
  type        = string
  default     = "index.html"
  description = "The file name for the index document of the static site. Default: 'index.html'"
  validation {
    condition     = can(regex("^[a-zA-Z0-9_\\-. ]+(\\.[a-zA-Z0-9]+)$", var.index_file_name))
    error_message = "INVALID INDEX FILE | Please specifiy a valid filename for 'index_file_name' or do not include this to use the default 'index.html'"
  }
}

variable "error_file_name" { # OPTIONAL
  type        = string
  default     = "error.html"
  description = "The file name for the error document of the static site. Default: 'error.html'"
  validation {
    condition     = can(regex("^[a-zA-Z0-9_\\-. ]+(\\.[a-zA-Z0-9]+)$", var.error_file_name))
    error_message = "INVALID ERROR FILE | Please specifiy a valid filename for 'error_file_name' or do not include this to use the default 'error.html'"
  }
}

variable "available_locations" { # OPTIONAL
  type        = list(string)
  default     = ["US", "CA", "GB"]
  description = "The default country codes to use for the Cloudfront distribution. Note that only EU and North American codes can be used for this price class. Default: [\"US\", \"CA\", \"GB\"]"
}

variable "domain_name" { # OPTIONAL
  type        = string
  default     = "abiwithey.co.uk"
  description = "The privately owned qualified domain name. This must be managed by Route53."
  validation {
    condition     = can(regex("^$|^([a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,6}$", var.domain_name))
    error_message = "INVALID DOMAIN NAME | Please specifiy a valid domain name for 'domain_name' or exclude this var to use an auto-generated alias."
  }
}

variable "domain_auto_renew" { # OPTIONAL
  type = bool
  default = true
  description = "States whether to assign auto-renewal to the managed Route53 domain." 
}

variable "enable_logging" { # OPTIONAL
  type = bool
  default = false
  description = "States whether to enable server logs for the static site."
}