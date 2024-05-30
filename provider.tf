# MODULE PROVIDERS

provider "aws" { # Provider with input region (default)
  region = var.aws_region
}

provider "aws" { # Provider used for ACM (hardcoded region as this is required for ACM cert)
  alias  = "acm_provider"
  region = "us-east-1"
}
