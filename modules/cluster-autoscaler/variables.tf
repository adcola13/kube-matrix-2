# modules/cluster-autoscaler/variables.tf
variable "cluster_name"          { type = string }
variable "region"                { type = string }
variable "name_prefix"           { type = string }
variable "project"               { type = string }
variable "environment"           { type = string }
variable "cluster_oidc_provider" { type = string } # ARN
#variable "cluster_oidc_issuer"   { type = string } # URL
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

