output "web_sg_id" {
  value       = aws_security_group.web_sg.id
  description = "Web security group ID"
}

output "instance_ids" {
  value = aws_instance.web[*].id
}
