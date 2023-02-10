####################################################
#                EKS CLUSTER                       #
####################################################
resource "aws_eks_cluster" "cloudacia_eks" {
  name     = "cloudacia_eks_cluster"
  role_arn = aws_iam_role.eks_control_plane.arn
  version  = var.eks_version
  vpc_config {
    subnet_ids = [aws_subnet.subnet01.id,
      aws_subnet.subnet02.id,
    aws_subnet.subnet03.id]
    security_group_ids     = [aws_security_group.eks_control_plane.id]
    endpoint_public_access = true
    public_access_cidrs    = ["0.0.0.0/0"]
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
