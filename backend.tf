terraform {
  backend "s3" {
    bucket         = "br-terraform-state-20251211112450"
    key            = "envs/dev/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "br-terraform-locks-20251211112450"
    encrypt        = true
  }
}
