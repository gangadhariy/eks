remote_state {
  backend = "s3" 
  generate = {
    path      = "state.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket          = "ekstest-state"
    region          = "us-east-1"
    encrypt         = true
    key             = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"  # Relative path to generated provider configuration
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "us-east-1"
}
EOF
}