output "public_ip" {
  value = module.ec2-module.Instance_Public_IP
}
output "public_dns" {
  value = module.ec2-module.Instance_Public_DNS
}