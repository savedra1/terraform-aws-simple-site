output "cert_record" {
  value       = aws_route53_record.cert_record[*]
  description = "The Route53 record for certificate validation"
}