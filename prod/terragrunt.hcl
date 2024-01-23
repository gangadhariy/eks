locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("aws-prod.hcl"))
  location_vars    = read_terragrunt_config(find_in_parent_folders("aws-prod.hcl"))
  cluster-name     = read_terragrunt_config(find_in_parent_folders("aws-prod.hcl"))  
  ami_vars         = read_terragrunt_config(find_in_parent_folders("aws-prod.hcl"))
  intance-vars     = read_terragrunt_config(find_in_parent_folders("aws-prod.hcl"))
  nodegroup1-vars  = read_terragrunt_config(find_in_parent_folders("aws-prod.hcl"))
  nodegroup2-vars  = read_terragrunt_config(find_in_parent_folders("aws-prod.hcl"))

# Extract out common variables for reuse
  env                = local.environment_vars.locals.environment
  aws_location       = local.location_vars.locals.awslocation
  eks_name           = local.cluster-name.locals.cluster
  amitype            = local.ami_vars.locals.ami-vaule
  instancetype       = local.intance-vars.locals.instace_type
  nodegroup_1        = local.nodegroup1-vars.locals.nodegroup1name
  nodegroup_2        = local.nodegroup2-vars.locals.nodegroup2name
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../modules/eks"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  location         = local.aws_location
  environment      = local.env
  cluster_name     = local.eks_name
  kubeconfig       = "kubeconfig-dev"
  ami_type         = local.amitype
  instace_type     = local.instancetype
  nodegroup1_name1 = local.nodegroup_1
  nodegroup2_name1 = local.nodegroup_2
  vpc_name         = "demo-vpc-akash"
  vpc_cidr         = "10.0.0.0/16"
  azs              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}