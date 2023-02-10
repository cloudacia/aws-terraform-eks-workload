####################################################
#                EKS CLUSTER NAME                  #
####################################################
output "eks_cluster_name" {
  value = aws_eks_cluster.cloudacia_eks.id
}

####################################################
#                EKS CLUSTER ENDPOINT              #
####################################################
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.cloudacia_eks.endpoint
}
