output "instance_public_ip" {
  description = "The Public IP of the Web Server"
  value = aws_instance.web.public_ip
}

output "instance_public_dns" {
  description = "The Public Domain name of the Web Server"
  value = aws_instance.web.public_dns
}

output "instance_id" {
  description = "The Instance ID"
  value = aws_instance.web.id
}