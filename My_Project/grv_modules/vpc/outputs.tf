output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "ami_id" {
  value = data.aws_ssm_parameter.my_ami.value
}