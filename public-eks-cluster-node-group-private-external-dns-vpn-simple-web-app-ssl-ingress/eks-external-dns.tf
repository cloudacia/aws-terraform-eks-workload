####################################################
# ASSOCIATE OICD PROVIDER TO EKS CLUSTER           #
####################################################
resource "null_resource" "associate_iam_oidc_provider" {
  provisioner "local-exec" {
    command = "eksctl utils associate-iam-oidc-provider --region=${var.aws_region} --cluster=${aws_eks_cluster.cloudacia_eks.id} --approve"
  }
  depends_on = [aws_eks_cluster.cloudacia_eks,
    aws_eks_addon.coredns,
  aws_eks_node_group.cloudacia_eks]
}

####################################################
# SERVICE ACCOUNT FOR EXTERNAL-DNS K8S OPERATOR    #
####################################################
resource "null_resource" "eks_external_dns_sevice_account" {
  provisioner "local-exec" {
    command = "eksctl create iamserviceaccount --name ${var.eks_service_account_name} --namespace ${var.eks_service_account_namespace} --cluster ${aws_eks_cluster.cloudacia_eks.id} --attach-policy-arn ${aws_iam_policy.eks_service_account.arn} --override-existing-serviceaccounts --approve"
  }
  depends_on = [null_resource.associate_iam_oidc_provider]
}

####################################################
# APPLY EXTERNAL-DNS MANIFEST TO EKS               #
####################################################
resource "null_resource" "eks_external_dns_manifest" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${var.eks_external_dns_manifest}"
  }
  depends_on = [null_resource.eks_external_dns_sevice_account]
}
