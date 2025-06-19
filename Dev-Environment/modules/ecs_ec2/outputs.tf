output "ecs_instance_id" {
  value = aws_instance.ecs_ec2.id
}

output "ecs_ec2_public_ip" {
  value = aws_instance.ecs_ec2.public_ip
}
