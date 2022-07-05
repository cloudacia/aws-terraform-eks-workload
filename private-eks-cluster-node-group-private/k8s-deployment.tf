####################################################
# DEPLOY WEB APP INTO EKS                          #
####################################################
resource "null_resource" "deploy_web_app" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${var.eks_deployment_manifest_1}"
  }
  depends_on = [null_resource.eks_external_dns_manifest]
}
