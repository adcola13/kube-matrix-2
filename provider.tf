provider "aws" {
  region = var.region
  # credentials via env vars or named profile
}

 # Fetch cluster info
data "aws_eks_cluster" "this" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}


provider "kubernetes" {
/*  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)*/

  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = [
      "eks",
      "get-token",
      "--cluster-name", module.eks.cluster_name,
      "--region", var.region,
      "--output", "json"
    ]
  }
}

provider "helm" {
  kubernetes ={
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

    exec ={
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = [
        "eks",
        "get-token",
        "--cluster-name", module.eks.cluster_name,
        "--region", var.region,
        "--output", "json"
      ]
    }
  }
}
