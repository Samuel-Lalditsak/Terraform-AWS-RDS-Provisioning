resource "aws_db_subnet_group" "default" {
  name       = "main"                # Name of the DB subnet group
  subnet_ids = [
    module.vpc.private_subnets[0],   # First private subnet ID from the VPC module
    module.vpc.private_subnets[1],   # Second private subnet ID from the VPC module
    module.vpc.private_subnets[2],   # Third private subnet ID from the VPC module
  ]
}
