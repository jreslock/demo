resource "aws_vpc" "demo" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags {
    Name      = "Demo"
    terraform = true
  }
}

resource "aws_security_group" "web" {
  name   = "web"
  vpc_id = "${aws_vpc.demo.id}"

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "web"
    terraform = true
  }
}
