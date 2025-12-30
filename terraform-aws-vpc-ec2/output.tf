output "public_ec2_ip" {
  value = aws_instance.public_ec2.public_ip
}

output "vpc_id" {
  value = aws_vpc.main.id
}