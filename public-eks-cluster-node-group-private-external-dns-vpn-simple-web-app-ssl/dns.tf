#######################################################
# GET DATA FROM AN AWS ROUTE53 ZONE                   #
#######################################################
data "aws_route53_zone" "cloudacia" {
  name         = var.domain_name
  private_zone = false
}

#######################################################
# CNAME record for validating server SSL certificate  #
#######################################################
resource "aws_route53_record" "cert_validation_record01" {
  for_each = {
    for dvo in aws_acm_certificate.certificate_asterisk.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = data.aws_route53_zone.cloudacia.zone_id
}
