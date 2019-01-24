module "web-east" {
  providers = {
    aws = "aws"
  }

  source            = "modules/compute"
  ami               = "ami-009d6802948d06e52"
  security_group_id = "${module.vpc-east.web_sg_id}"
  subnet_id         = "${module.vpc-east.public_a_subnet_id}"
}

module "web-west" {
  providers = {
    aws = "aws.west"
  }

  source            = "modules/compute"
  ami               = "ami-01bbe152bf19d0289"
  security_group_id = "${module.vpc-west.web_sg_id}"
  subnet_id         = "${module.vpc-west.public_a_subnet_id}"
}

resource "aws_route53_record" "www" {
  name    = "jreslock.zaius.cafe"
  type    = "A"
  ttl     = "300"
  zone_id = "ZINVJ3PULOKPN"

  records = ["${module.web-east.public_ip}", "${module.web-west.public_ip}"]
}
