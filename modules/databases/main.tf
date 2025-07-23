resource "aws_rds_cluster" "pg_db_cluster" {
  engine                 = "aurora-postgresql"
  engine_version         = "16.6"
  master_username        = "username"
  master_password        = "password"
  db_subnet_group_name   = aws_db_subnet_group.pg_subnet_group.name
  vpc_security_group_ids = [aws_security_group.pg_security_group.id]
  skip_final_snapshot    = true
}

resource "aws_rds_cluster_instance" "aurora_pg_instance" {
  cluster_identifier  = aws_rds_cluster.pg_db_cluster.id
  engine              = aws_rds_cluster.pg_db_cluster.engine
  engine_version      = aws_rds_cluster.pg_db_cluster.engine_version
  instance_class      = "db.t3.medium"
  publicly_accessible = true
}
