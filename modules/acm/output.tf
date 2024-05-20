output "cert_arn" {
  value = aws_acm_certificate.domain_cert[*].arn
}

output "domain_validation_options" {
  value = aws_acm_certificate.domain_cert[*].domain_validation_options
}