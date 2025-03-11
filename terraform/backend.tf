terraform {
  backend "s3" {
    bucket         = "my-app-terraform-state-bucket"
    key            = "terraform/state.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}