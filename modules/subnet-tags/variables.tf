variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to apply"
}