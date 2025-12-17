region              = "us-east-1"
prefix              = "km"
bucket_prefix       = "km-terraform-state"
dynamodb_table_name = "terraform-locks"
tags = {
  Project     = "kube-matrix"
  Environment = "bootstrap"
  ManagedBy   = "terraform"
}
