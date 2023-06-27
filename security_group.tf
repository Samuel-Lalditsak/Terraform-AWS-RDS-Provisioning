resource "aws_security_group" "team3-db" {
  name        = "team3-db-security-group"          # Name of the security group
  description = "Security group for team3-db"      # Description of the security group
  vpc_id      = module.vpc.vpc_id                  # ID of the VPC where the security group will be created
  ingress {
    from_port   = 3306              # Port range start for inbound traffic
    to_port     = 3306              # Port range end for inbound traffic
    protocol    = "tcp"             # Protocol for inbound traffic
    cidr_blocks = ["0.0.0.0/0"]     # CIDR blocks to allow inbound traffic from (in this case, allowing from any IP)
  }
  egress {
    from_port   = 0              # Port range start for outbound traffic
    to_port     = 0              # Port range end for outbound traffic
    protocol    = "-1"           # Protocol for outbound traffic (-1 represents all protocols)
    cidr_blocks = ["0.0.0.0/0"]  # CIDR blocks to allow outbound traffic to (in this case, allowing to any IP)
  }
}
