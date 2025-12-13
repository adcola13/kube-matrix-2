terraform {
  backend "s3" {
    bucket         = "km-terraform-state-dev-20251213042220"
    key            = "envs/dev/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "km-terraform-locks-dev-20251213042220"
    encrypt        = true
  }
}
