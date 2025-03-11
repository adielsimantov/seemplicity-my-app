variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

data "aws_availability_zones" "available" {
  state = "available"
}

variable "private_subnets_cidr_block" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets_cidr_block" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "enable_nat_gateway" {
  description = "Provision NAT Gateways for each of your private networks"
  type    = bool
  default = true
}

variable "enable_vpn_gateway" {
  description = "Create a new VPN Gateway resource and attach it to the VPC"
  type    = bool
  default = false
}

variable "tags" {
    type = map(string)
    default = {
        Terraform = "true"
        Environment = "dev"
        Application_name = "my-app"
    }
}

variable "sg_tags" {
    type = map(string)
    default = {
        Name = "my-app-sg"
    }
}

variable "sg_name" {
  type    = string
  default = "my-app-sg"
}

variable "sg_description" {
  type    = string
  default = "Allow HTTP inbound traffic for my app"
}

variable "sg_ingress_rules" {
    type = map
    default = {
      cidr_ipv4         = "0.0.0.0/0"
      from_port         = 80
      ip_protocol       = "tcp"
      to_port           = 80
    }
}


