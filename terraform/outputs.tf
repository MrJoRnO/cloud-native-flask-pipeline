output "eks_cluster_name" {
  value = module.eks.cluster_name 
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint 
}

output "ecr_repository_url" {
  value = module.ecr.repository_url 
}

output "iam_role_arn" {
  value = module.eks.cluster_iam_role_arn
}