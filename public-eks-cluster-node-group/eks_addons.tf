####################################################
#  INSTALLING AMAZON VPC CNI ADDON                 #
####################################################

resource "aws_eks_addon" "vpc-cni" {
  cluster_name = aws_eks_cluster.cloudacia_eks.name
  addon_name   = "vpc-cni"
}

####################################################
#  INSTALLING CORE DNS ADDON                       #
####################################################
resource "aws_eks_addon" "coredns" {
  cluster_name      = aws_eks_cluster.cloudacia_eks.name
  addon_name        = "coredns"
  resolve_conflicts = "OVERWRITE"
}

####################################################
#  INSTALLING KUBE PROXY ADDON                     #
####################################################
resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.cloudacia_eks.name
  addon_name   = "kube-proxy"
}
