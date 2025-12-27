variable "name" {
  type        = string
  description = "Name prefix for ALB resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the ALB"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for ALB"
}

variable "security_groups" {
  type        = list(string)
  description = "Security groups for ALB"
}

variable "instance_ids" {
  type        = list(string)
  description = "EC2 instance IDs to attach to ALB target group"
}
