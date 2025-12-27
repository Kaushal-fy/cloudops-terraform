resource "aws_db_subnet_group" "default" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "main" {
  identifier        = "${var.name}-db"
  engine            = "postgres"
  instance_class    = var.instance_class
  username          = var.username
  password          = var.password
  allocated_storage = var.allocated_storage
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible  = false
  skip_final_snapshot  = true
}
