####################################################
#                EKS WORKER                        #
####################################################
resource "aws_eks_node_group" "cloudacia_eks" {
  cluster_name    = aws_eks_cluster.cloudacia_eks.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_data_plane.arn
  subnet_ids = [aws_subnet.subnet07.id,
    aws_subnet.subnet08.id,
  aws_subnet.subnet09.id]
  instance_types = [var.instance_type]

  scaling_config {
    desired_size = 3
    max_size     = 3
    min_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_data_plane_1,
    aws_iam_role_policy_attachment.eks_data_plane_2,
    aws_iam_role_policy_attachment.eks_data_plane_3,
  ]
}
