locals {
  cluster_name = var.cluster_name
  public_subnet_map  = { for idx, id in var.public_subnet_ids  : idx => id }
  private_subnet_map = { for idx, id in var.private_subnet_ids : idx => id }
}

# -------------------------------------------
# TAG PUBLIC SUBNETS (for INTERNET ALB)
# -------------------------------------------
resource "aws_ec2_tag" "public_role_tag" {
  for_each = local.public_subnet_map

  resource_id = each.value
  key         = "kubernetes.io/role/elb"
  value       = "1"
}

resource "aws_ec2_tag" "public_cluster_tag" {
  for_each = local.public_subnet_map

  resource_id = each.value
  key         = "kubernetes.io/cluster/${local.cluster_name}"
  value       = "shared"
}

# -------------------------------------------
# TAG PRIVATE SUBNETS (for INTERNAL ALB)
# -------------------------------------------
resource "aws_ec2_tag" "private_role_tag" {
  for_each = local.private_subnet_map

  resource_id = each.value
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}

resource "aws_ec2_tag" "private_cluster_tag" {
  for_each = local.private_subnet_map

  resource_id = each.value
  key         = "kubernetes.io/cluster/${local.cluster_name}"
  value       = "shared"
}
