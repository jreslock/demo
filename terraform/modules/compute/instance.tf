variable "ami" {}
variable "security_group_id" {}
variable "subnet_id" {}

resource "aws_instance" "web" {
  ami                    = "${var.ami}"
  instance_type          = "m1.small"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.security_group_id}"]

  user_data = "${data.template_file.init.rendered}"

  tags {
    Name      = "Web"
    terraform = true
  }
}

data "template_file" "init" {
  template = "${file("${path.module}/templates/cloud-init.sh.tpl")}"
}
