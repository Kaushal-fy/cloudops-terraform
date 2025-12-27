variable "name" {
  type        = string
  description = "Name prefix for RDS resources"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for RDS subnet group"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class"
}

variable "username" {
  type        = string
  description = "Master username for RDS"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "Master password for RDS"
  sensitive   = true
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage in GB"
}
