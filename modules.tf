module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "instance1"

  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = ["sg-0189b7d27321f1d76"]
  subnet_id              = "subnet-08210b8175a78e443"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "development"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
/*
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}*/