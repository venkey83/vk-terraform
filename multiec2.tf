locals {
multiple_instances = {
one = {
ami = "ami-ebd02392"
subnet_id = "element(module.vpc.private_subnets, 0)"
}

two = {
ami = "ami-edvbd02392"
subnet_id = "element(module.vpc.private_subnets, 1)"
}

}
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"
 for_each = local.multiple_instances

  name = "single-ec2"
#  ami                    = "ami-ebd02392"
  ami                    = each.value.ami
  instance_type          = "t2.micro"
  #key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  #subnet_id              = "subnet-eddcdzz4"
  #subnet_id              = element(module.vpc.private_subnets, 0)
  #subnet_id              = element(local.subs,count.index)
  subnet_id              = each.value.subnet_id
#  vpc_security_group_ids      = [module.security_group.security_group_id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
