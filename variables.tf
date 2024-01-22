variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "state_bucket" {
  type    = string
  default = "interesting-bucket-for-test-yes"

}

variable "vpc_name" {
  type        = string
  description = "Name to be used on all the resources as identifier"
}


variable "vpc_cidr" {
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
}
variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC"
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones specified as argument to this module"
}
variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
}
variable "enable_vpn_gateway" {
  type        = bool
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"

}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want only one NAT Gateway per availability zone"
  
}
variable "enable_dns_hostnames" {
  type        = bool
  description = "Should be true to enable DNS hostnames in the VPC"
  
}
variable "enable_dns_support" {
  type        = bool
  description = "Should be true to enable DNS support in the VPC"

}
variable "vpc_tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "prod"
  }
}

##### EkS Cluster Variables defined #######
variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}
