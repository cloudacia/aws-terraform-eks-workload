####################################################
#                EKS CLUSTER                       #
####################################################
resource "aws_eks_cluster" "cloudacia_eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_control_plane.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    subnet_ids = [aws_subnet.subnet04.id,
      aws_subnet.subnet05.id,
    aws_subnet.subnet06.id]
    security_group_ids = [aws_security_group.eks_control_plane.id]
  }

  kubernetes_network_config {
    ip_family = "ipv4"
  }

  depends_on = [
    aws_iam_role.eks_control_plane,
    data.aws_iam_policy.eks_control_plane,
    aws_iam_role_policy_attachment.eks_control_plane
  ]
}

####################################################
# GETTING EKS CONFIGURATION FILE FOR KUBECTL       #
####################################################
resource "null_resource" "get_kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.aws_region} --name ${aws_eks_cluster.cloudacia_eks.id}"
  }
  depends_on = [aws_eks_cluster.cloudacia_eks]
}
