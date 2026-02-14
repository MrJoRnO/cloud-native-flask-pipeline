# Role for Cluster
resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

# IAM Role for Nodes
resource "aws_iam_role" "nodes" {
  name = "eks-node-group-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" } 
    }]
  })
}

resource "aws_iam_role_policy_attachment" "nodes_policies" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ])
  policy_arn = each.value
  role       = aws_iam_role.nodes.name
}

# Cluster
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  vpc_config { subnet_ids = var.subnet_ids }
  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

# Node Groups
resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "app-nodes"
  node_role_arn   = aws_iam_role.nodes.arn
  subnet_ids      = var.private_subnet_ids 
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  capacity_type  = "ON_DEMAND"

  launch_template {
    name    = aws_launch_template.eks_nodes.name
    version = aws_launch_template.eks_nodes.latest_version
  }

  depends_on = [aws_iam_role_policy_attachment.nodes_policies]
}

resource "aws_launch_template" "eks_nodes" {
  name_prefix   = "eks-nodes-"
  instance_type = "c7i-flex.large"
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "eks-node"
    }
  }
}