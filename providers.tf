terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
}


module "backend" {
    source = "./backend"
    state_bucket = var.state_bucket
}

module "vpc" {
  source = "./vpc"
  cluster_name = var.cluster_name
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs = var.azs
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support

}

module "eks" {
  source = "./eks"
  cluster_name = var.cluster_name
  vpc_id = module.vpc.vpc_id
  vpc_private_subnets = module.vpc.private_subnets

}