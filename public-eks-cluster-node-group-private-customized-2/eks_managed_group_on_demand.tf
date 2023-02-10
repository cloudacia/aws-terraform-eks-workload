####################################################
#                EKS WORKER                        #
####################################################
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_name_1
  node_role_arn   = aws_iam_role.eks_data_plane.arn
  subnet_ids      = [aws_subnet.subnet04.id, aws_subnet.subnet05.id, aws_subnet.subnet06.id]
  instance_types  = [var.instance_type]
  capacity_type   = var.capacity_type_1

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
