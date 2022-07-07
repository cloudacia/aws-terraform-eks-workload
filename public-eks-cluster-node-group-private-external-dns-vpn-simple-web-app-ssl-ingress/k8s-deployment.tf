

###############################################################
# SETTING UP THE CURRENT SSL CERTIFICATE FOR A SERVICE OBJECT #
###############################################################
resource "null_resource" "modify_file_yaml_1" {
  provisioner "local-exec" {
    command = "chmod 777 ./script.sh; ./script.sh ${aws_acm_certificate.certificate_asterisk.arn} ${var.eks_deployment_manifest_1}"
  }
  depends_on = [
    null_resource.eks_external_dns_manifest
  ]
}

###############################################################
# SETTING UP THE CURRENT SSL CERTIFICATE FOR A SERVICE OBJECT #
###############################################################
resource "null_resource" "modify_file_yaml_2" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${var.eks_deployment_manifest_1}"
  }
  depends_on = [
    null_resource.modify_file_yaml_1
  ]
}
