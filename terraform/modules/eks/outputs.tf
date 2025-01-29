output "eks_cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_group_id" {
  value = aws_eks_node_group.eks_nodes.id
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_group_role.arn
}
