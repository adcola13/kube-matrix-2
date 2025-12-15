resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = <<-EOT
      # Worker node role
      - rolearn: ${aws_iam_role.node_group.arn}
        username: system:node:{{EC2PrivateDNSName}}
        groups:
          - system:bootstrappers
          - system:nodes

      # GitHub Actions OIDC role
      - rolearn: var.github_action_role_arn
        username: github-actions
        groups:
          - system:masters
    EOT
  }

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main
  ]
}
