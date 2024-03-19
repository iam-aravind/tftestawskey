terraform {}

resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}

output "private_key_pem" {
  value = tls_private_key.rsa.private_key_pem
  sensitive = true
}

data "tls_public_key" "rsa" {
  private_key_pem = tls_private_key.rsa.private_key_pem
}

output "public_key_pem" {
  value     = data.tls_public_key.rsa.public_key_pem
  sensitive = true
}
