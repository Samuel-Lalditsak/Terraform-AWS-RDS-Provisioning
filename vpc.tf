module "vpc" {
  source        = "youradmin@947053337453/vpc/aws" #<provider>/<organization>/<module>    # Source of the VPC module
  version       = "6.0.0"              # Version of the VPC module to use
  region        = "ap-south-1"         # AWS region for the VPC
  vpc_cidr      = "10.0.0.0/16"        # CIDR block for the VPC
  public_cidr1  = "10.0.1.0/24"        # CIDR block for the first public subnet
  public_cidr2  = "10.0.2.0/24"        # CIDR block for the second public subnet
  public_cidr3  = "10.0.3.0/24"        # CIDR block for the third public subnet
  private_cidr1 = "10.0.101.0/24"      # CIDR block for the first private subnet
  private_cidr2 = "10.0.102.0/24"      # CIDR block for the second private subnet
  private_cidr3 = "10.0.103.0/24"      # CIDR block for the third private subnet
  tags = {
    Name        = "VPC_Project"    # Tags for the VPC module
    Environment = "Dev"            # Tags for the VPC module
    Created_by  = "947053337453"   # Tags for the VPC module
  }
}

output "vpc" {
  value = module.vpc.vpc                   # Output the VPC ID from the VPC module
}
output "private_subnet1" {
  value = module.vpc.private_subnets[0]    # Output the first private subnet ID from the VPC module
}


output "private_subnet2" {
  value = module.vpc.private_subnets[1]    # Output the second private subnet ID from the VPC module
}

output "private_subnet3" {
  value = module.vpc.private_subnets[2]    # Output the third private subnet ID from the VPC module
}


output "public_subnet1" {
  value = module.vpc.public_subnets[0]    # Output the first public subnet ID from the VPC module
}


output "public_subnet2" {
  value = module.vpc.public_subnets[1]    # Output the second public subnet ID from the VPC module
}

output "public_subnet3" {
  value = module.vpc.public_subnets[2]    # Output the third public subnet ID from the VPC module
}

output "region" {
  value = module.vpc.region              # Output the region from the VPC module
}
