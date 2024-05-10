resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }

  version = var.kubernetes_version
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "kubernetes_namespace" "databee" {
  metadata {
    annotations = {
      environment = "lab"
    }
    name = var.kubernetes_namespace
  }
  
}

resource "aws_iam_role" "eks_cluster" {
  name = var.eks_cluster_service_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = { Service = "eks.amazonaws.com" },
        Action    = "sts:AssumeRole"
      }
    ]
  })
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cni" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ecr_read_only" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name

  depends_on = [aws_eks_cluster.eks_cluster]
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name

  depends_on = [aws_eks_cluster.eks_cluster]

}

resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name           = aws_eks_cluster.eks_cluster.name
  fargate_profile_name   = var.fargate_profile_name
  pod_execution_role_arn = aws_iam_role.fargate_role.arn
  subnet_ids = [
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  selector {
    namespace = "databeelab"
  }

  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "aws_iam_role" "fargate_role" {
  name = var.fargate_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = { Service = "eks-fargate-pods.amazonaws.com" },
        Action    = "sts:AssumeRole"
      }
    ]
  })
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}