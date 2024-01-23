resource "vpc" "demo_vpc" {

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = var.azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "eks_cluster" "demo_ekscluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = var.eks_cluster_name
  subnet_ids   = module.vpc.private_subnets
  vpc_id       = module.vpc.vpc_id
  cluster_endpoint_public_access = true
  eks_managed_node_group_defaults = {
    ami_type = var.amitype

  }

  eks_managed_node_groups = {
    one = {
      name = var.nodegroup1_name1

      instance_types = [var.instance_type]

      min_size     = 1
      max_size     = 2
      desired_size = 2
    }

    two = {
      name = var.nodegroup2_name1

      instance_types = [var.instance_type]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}

# output "kubeconfig" {
#   value = module.eks_cluster.kubeconfig
# }

# output "config_map_aws_auth" {
#   value = module.eks_cluster.config_map_aws_auth
# }
