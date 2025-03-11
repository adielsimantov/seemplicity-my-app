
# seemplicity application

## Terraform
This repository contains Terraform folder with the configuration files for provisioning an AWS VPC with associated networking components and a security group for an application.

### Features

VPC Creation: Deploys a VPC with configurable CIDR blocks and subnets.

Subnets: Supports private and public subnets.

Security Group: Creates a security group for the application with ingress rules for HTTP traffic.

NAT & VPN Support: Optional NAT Gateway and VPN Gateway provisioning.


### File Structure

providers.tf - Defines the AWS provider and required Terraform providers.

variables.tf - Contains configurable variables such as region, VPC CIDR, subnet CIDRs, security group settings, and tags.

vpc.tf - Deploys the VPC using the terraform-aws-modules/vpc module.

sg.tf - Creates a security group and ingress rules for the application.


## Prerequisites

Terraform (>= 1.0)

AWS credentials configured (~/.aws/credentials or environment variables)


### Configuration Variables


| Variable             | Description     | Default Value |
| ----------------- | -------------------|----------------------------------------------- |
| Region | AWS region for deployment | eu-west-1|
| vpc_name | Name of the VPC | my-vpc |
| vpc_cidr_block | CIDR block for the VPC | 10.0.0.0/16
| private_subnets_cidr_block | CIDR block of private subnets | 10.0.1.0/24, 10.0.2.0/24
| private_subnets_cidr_block | CIDR block of public subnets|10.0.101.0/24, 10.0.102.0/24 |
| enable_nat_gateway | Enable NAT gateway for private subnet|true |
| enable_vpn_gateway | Enable NAT gateway for private subnet| false|
| sg_name | security groups name for EKS | my-app-sg| 
| sg_description | security groups description for my-app| Allow HTTP inbound traffic for my app|
| sg_ingress_rules | The ingress rules for the security groups| port 80 opened 0.0.0.0/0 |
|tags|Tags of all the resources| terraform: true, Environment: dev, application_name: my-app



### Usage

```terraform
terraform init
terraform plan
terraform apply
terraform destory (if needed)
```


### Resources Created

AWS VPC (with 2 AZs)

Public and Private Subnets (Private & Public subnets per AZ)

Route tables

Security Group with HTTP Access

NAT Gateway

Internet Gateway

(Optional) VPN Gateway
