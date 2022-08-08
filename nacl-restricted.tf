resource "aws_network_acl" "SPN_ACL-communication" {
  vpc_id = "${aws_vpc.StudentPlacement-Frankfurt-vpc.id}"
  subnet_ids = [ "${aws_subnet.StudentPlacement-Frankfurt-restricted-subnet-1a.id}",
  "${aws_subnet.StudentPlacement-Frankfurt-restricted-subnet-1b.id}",
  "${aws_subnet.StudentPlacement-Frankfurt-restricted-subnet-1c.id}"
   ]
# allow port 22
  ingress {
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"

  }
# allow egress ephemeral ports
  egress {

    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
  }
tags = {
    Name = "SPN_ACL-communication"
    }
}