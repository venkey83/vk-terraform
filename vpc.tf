data "aws_availability_zones" "available" {
state = "available"
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.16.0"

name = "tf-vpc"
cidr = "10.0.0.0/16"
#azs = ["data.aws_availability_zones.available.names[0]", "data.aws_availability_zones.available.names[1]", "data.aws_availability_zones.available.names[2]"]
azs = data.aws_availability_zones.available.names
private_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets      = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

enable_dns_hostnames = true
enable_dns_support   = true

enable_nat_gateway = true
single_nat_gateway = true
one_nat_gateway_per_az = false

}
