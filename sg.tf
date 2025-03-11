resource "aws_security_group" "my-app-sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = module.vpc.vpc_id

  tags = "${merge(var.tags, var.sg_tags)}"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.my-app-sg.id
  cidr_ipv4         = var.sg_ingress_rules["cidr_ipv4"]
  from_port         = var.sg_ingress_rules["from_port"]
  ip_protocol       = var.sg_ingress_rules["ip_protocol"]
  to_port           = var.sg_ingress_rules["to_port"]
}

