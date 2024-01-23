variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
}
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string 
}
variable "azs" {
  description = "The availability zones for the VPC."
  type        = list(string)
}

variable "private_subnets" {
  description = "The private subnets CIDR blocks for the VPC."
  type        = list(string)
}

variable "public_subnets" {
  description = "The public subnets CIDR blocks for the VPC."
  type        = list(string)
}
variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}
variable "nodegroup1_name1" {
  description = "Name of the node group"
  type        = string
}
variable "nodegroup2_name1" {
  description = "Name of the node group"
  type        = string
}
variable "amitype" {
  description = "Name of the node group"
  type        = string
}
variable "instance_type" {
  description = "Name of the node group"
  type        = string
}
