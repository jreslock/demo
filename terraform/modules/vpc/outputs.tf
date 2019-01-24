output "vpc_id" {
  value = "${aws_vpc.demo.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.demo.cidr_block}"
}

output "default_sg_id" {
  value = "${aws_vpc.demo.default_security_group_id}"
}

output "web_sg_id" {
  value = "${aws_security_group.web.id}"
}

output "default_rtb_id" {
  value = "${aws_vpc.demo.default_route_table_id}"
}

output "public_a_subnet_id" {
  value = "${aws_subnet.public-a.id}"
}
