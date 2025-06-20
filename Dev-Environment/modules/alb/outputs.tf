output "alb_sg_id" {
  value = aws_security_group.alb_sg.id  # Make sure this matches your SG resource name
}

output "alb_dns" {
  description = "ALB DNS Name"
  value       = aws_lb.app.dns_name
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = aws_lb_target_group.app.arn
}

output "alb_zone_id" {
  description = "ALB zone ID (used for Route 53 if needed)"
  value       = aws_lb.app.zone_id
}
