resource "random_password" "password" {
  length           = 30
  special          = false
  override_special = "_%@"
}

resource "aws_ssm_parameter" "team3db" {
  name  = var.aws_ssm_parameter_name
  type  = "SecureString"
  value = random_password.password.result
}

resource "aws_db_subnet_group" "default" {
  name        = "example-db-subnet-group"
  description = "Example DB subnet group"
  subnet_ids  = ["subnet-12345678", "subnet-23456789"]  # Replace with actual subnet IDs
}

resource "aws_rds_cluster" "default" {
  cluster_identifier   = "dbname"
  engine               = "aurora"
  engine_version       = "5.6.10a"
  database_name        = "dbname"
  master_username      = "team3db"
  master_password      = random_password.password.result
  db_subnet_group_name = aws_db_subnet_group.default.name
  skip_final_snapshot  = true
  vpc_security_group_ids = [
    aws_security_group.team3-db.id
  ]
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "aurora-cluster-demo-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = "db.r4.large"
  engine_version     = aws_rds_cluster.default.engine_version
  engine             = aws_rds_cluster.default.engine
}

resource "aws_rds_cluster_instance" "cluster_instances_reader1" {
  count              = 1
  identifier         = "aurora-cluster-demo-reader1-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = "db.r4.large"
  engine_version     = aws_rds_cluster.default.engine_version
  engine             = aws_rds_cluster.default.engine
}

resource "aws_rds_cluster_instance" "cluster_instances_reader2" {
  count              = 1
  identifier         = "aurora-cluster-demo-reader2-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = "db.r4.large"
  engine_version     = aws_rds_cluster.default.engine_version
  engine             = aws_rds_cluster.default.engine
}

resource "aws_rds_cluster_instance" "cluster_instances_reader3" {
  count              = 1
  identifier         = "aurora-cluster-demo-reader3-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  instance_class     = "db.r4.large"
  engine_version     = aws_rds_cluster.default.engine_version
  engine             = aws_rds_cluster.default.engine
}

output "reader_endpoint" {
  value = aws_rds_cluster.default.reader_endpoint
}

output "writer_endpoint" {
  value = aws_rds_cluster.default.endpoint
}