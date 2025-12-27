variable "name" {
  type        = string
  description = "Name prefix for EC2 resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where EC2 instances will be created"
}

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances"
}

variable "ami" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for EC2 instances"
}
