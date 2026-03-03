provider "aws" {
  region = "us-east-1"

}

terraform {
  backend "s3" {
    bucket = "my-gha-resources"
    region = "us-east-1"
    key = "github-actions/terraform.tfstate"
    encrypt = true
    use_lockfile = true     // Prevents Terraform backend from being modified by another.
  }
}