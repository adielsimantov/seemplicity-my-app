module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"
  name               = var.vpc_name
  cidr               = var.vpc_cidr_block
  azs                = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets    = var.private_subnets_cidr_block
  public_subnets     = var.public_subnets_cidr_block

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  tags               = var.tags
}