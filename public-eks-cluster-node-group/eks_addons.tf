resource "aws_eks_addon" "vpc-cni" {
  cluster_name = aws_eks_cluster.cloudacia_eks.name
  addon_name   = "vpc-cni"
}

resource "aws_eks_addon" "coredns" {
  cluster_name      = aws_eks_cluster.cloudacia_eks.name
  addon_name        = "coredns"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.cloudacia_eks.name
  addon_name   = "kube-proxy"
}

#resource "aws_eks_addon" "adot" {
#  cluster_name = aws_eks_cluster.cloudacia_eks.name
#  addon_name   = "adot"
#}

#resource "aws_eks_addon" "aws-ebs-csi-driver" {
#  cluster_name = aws_eks_cluster.cloudacia_eks.name
#  addon_name   = "aws-ebs-csi-driver"
#}
