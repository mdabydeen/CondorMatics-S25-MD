resource "aws_db_instance" "postgres_db" {
  identifier             = "local-postgres-db"
  engine                 = "postgres"
  engine_version         = "16.6"
  instance_class         = "t2.large"
  allocated_storage      = 20
  username               = "username"
  password               = "password"
  db_subnet_group_name   = aws_db_subnet_group.pg_subnet_group.name
  parameter_group_name   = aws_db_parameter_group.pg_parameter_group.name
  vpc_security_group_ids = [aws_security_group.pg_security_group.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
}