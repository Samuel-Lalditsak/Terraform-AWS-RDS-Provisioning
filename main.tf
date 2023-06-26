resource "random_password" "password" {
  length           = 30           # Length of the generated password
  special          = false        # Whether to include special characters
  override_special = "_%@"        # Special characters to include if 'special' is false
}

resource "aws_ssm_parameter" "team3db" {
  name  = var.aws_ssm_parameter_name        # Name of the SSM parameter
  type  = "SecureString"                    # Type of the SSM parameter
  value = random_password.password.result   # Value of the SSM parameter set to the generated random password
}

resource "aws_db_subnet_group" "default" {
  name        = "example-db-subnet-group"                  # Name of the DB subnet group
  description = "Example DB subnet group"                  # Description of the DB subnet group
  subnet_ids  = ["subnet-12345678", "subnet-23456789"]     # Replace with actual subnet IDs
}

resource "aws_rds_cluster" "default" {
  cluster_identifier   = "dbname"      # Identifier for the RDS cluster
  engine               = "aurora"      # Database engine for the RDS cluster
  engine_version       = "5.6.10a"     # Version of the database engine
  database_name        = "dbname"      # Name of the database
  master_username      = "team3db"     # Master username for the RDS cluster
  master_password      = random_password.password.result      # Master password set to the generated random password
  db_subnet_group_name = aws_db_subnet_group.default.name     # Name of the DB subnet group associated with the cluster
  skip_final_snapshot  = true          # Whether to skip the final snapshot when deleting the cluster
  vpc_security_group_ids = [
    aws_security_group.team3-db.id     # ID of the security group associated with the cluster (Not provided in the given file)
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
