resource "aws_security_group" "team3-db" {
  name        = "team3-db-security-group"
  description = "Security group for team3-db"
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
