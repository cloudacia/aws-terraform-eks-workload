####################################################
# SERVICE ACCOUNT FOR AWS ALB INGRESS K8S OPERATOR #
####################################################
resource "null_resource" "eks_alb_ingress_sevice_account" {
  provisioner "local-exec" {
    command = "eksctl create iamserviceaccount --name ${var.eks_service_account_name_2} --namespace ${var.eks_service_account_namespace} --cluster ${aws_eks_cluster.cloudacia_eks.id} --attach-policy-arn ${aws_iam_policy.eks_service_account_alb_operator.arn} --override-existing-serviceaccounts --approve"
  }
  depends_on = [null_resource.eks_external_dns_manifest]
}

####################################################
# INSTALL TargetGroupBinding                       #
####################################################
resource "null_resource" "eks_alb_ingress_targetgroupbinding" {
  provisioner "local-exec" {
    command = "kubectl apply -k ${var.targetgroupbinding}"
  }
  depends_on = [null_resource.eks_alb_ingress_sevice_account]
}

####################################################
# Add the EKS-CHARTS repository                    #
####################################################
resource "null_resource" "eks_charts_repository" {
  provisioner "local-exec" {
    command = "helm repo add eks ${var.els_charts_repo}"
  }
  depends_on = [null_resource.eks_alb_ingress_targetgroupbinding]
}

####################################################
# Install AWS Load Balancer Controler              #
####################################################
resource "null_resource" "eks_install_alb_ingress_controller" {
  provisioner "local-exec" {
    command = "helm upgrade -i ${var.eks_alb_controller_name} --set clusterName=${var.eks_cluster_name} --set serviceAccount.create=false --set serviceAccount.name=${var.eks_service_account_name_2} -n ${var.eks_service_account_namespace}"
  }
  depends_on = [null_resource.eks_charts_repository]
}
