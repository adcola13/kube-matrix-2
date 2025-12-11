region              = "us-east-1"
prefix              = "br"
bucket_prefix       = "br-terraform-state"
dynamodb_table_name = "br-terraform-locks"
tags = {
  Project     = "book-review"
  Environment = "bootstrap"
  ManagedBy   = "terraform"
}
