
output "website_endpoint" {
  value = ""
}

resource "null_resource" "write_endpoint_to_file" {
  provisioner "local-exec" {
    command = "echo ${module.cloudfront.cf_domain} > static_site_endpoint.txt'"
  }
}