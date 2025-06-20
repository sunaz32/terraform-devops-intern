output "alb_sg_id" {
  value = aws_security_group.alb_sg.id  # Make sure this matches your SG resource name
}
