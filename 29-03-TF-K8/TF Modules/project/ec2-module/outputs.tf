output "Instance_Public_IP" {
  value = aws_instance.web.private_ip
}
output "Instance_Public_DNS" {
  value = aws_instance.web.private_dns
}