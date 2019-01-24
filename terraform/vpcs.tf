module "vpc-east" {
  providers = {
    aws = "aws"
  }

  az             = "us-east-1a"
  source         = "modules/vpc"
  vpc_cidr       = "10.50.0.0/16"
  public_1a_cidr = "10.50.2.0/24"
}

module "vpc-west" {
  providers = {
    aws = "aws.west"
  }

  az             = "us-west-2a"
  source         = "modules/vpc"
  vpc_cidr       = "10.70.0.0/16"
  public_1a_cidr = "10.70.2.0/24"
}
