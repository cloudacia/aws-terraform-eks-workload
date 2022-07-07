

###############################################################
# SETTING UP THE CURRENT SSL CERTIFICATE FOR A SERVICE OBJECT #
###############################################################
resource "null_resource" "modify_file_yaml_3" {
  provisioner "local-exec" {
    command = "chmod 777 ./script2.sh; ./script2.sh ${aws_subnet.subnet01.id} ${aws_subnet.subnet02.id} ${aws_subnet.subnet03.id} ${var.www_dns_record02} ${aws_acm_certificate.certificate_asterisk.arn} ${var.eks_deployment_manifest_2}"
  }
  depends_on = [
    null_resource.eks_install_alb_ingress_controller
  ]
}

###############################################################
# DEPLOY SINGLE WEB APPLICATION                              #
###############################################################
resource "null_resource" "modify_file_yaml_4" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${var.eks_deployment_manifest_2}"
  }
  depends_on = [
    null_resource.modify_file_yaml_3
  ]
}
