output "private_ip" {
  value = [for t in aws_instance.web : t.private_ip[*]]
}

output "public_ip" {
  value = [for t in aws_instance.web : t.public_ip[*]]
}