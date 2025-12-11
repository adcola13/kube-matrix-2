terraform {
  backend "s3" {
    bucket         = "br-terraform-state-20251211111554"
    key            = "envs/dev/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "br-terraform-locks-20251211111554"
    encrypt        = true
  }
}
