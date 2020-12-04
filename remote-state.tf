data "terraform_remote_state" "network" {
  backend = "s3"

  workspace = terraform.workspace

  config = {
    bucket         = var.production_account ? "global-self-service-terraform-state" : "global-self-service-dev-terraform-state"
    key            = "base.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

locals {
  cluster_name = data.terraform_remote_state.network.outputs.cluster_name
  environment  = data.terraform_remote_state.network.outputs.environment
}
