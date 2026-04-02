resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "db" {
  allocated_storage = 20
  engine            = "mysql"
  instance_class    = "db.t3.micro"

  username = var.db_user
  password = var.db_pass
  db_name  = var.db_name

  skip_final_snapshot      = true
  vpc_security_group_ids   = [var.db_sg]
  db_subnet_group_name     = aws_db_subnet_group.db_subnet.name
}