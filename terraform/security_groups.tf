resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "allow inbound ssh access to instances from the internet"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags {
    Name = "ssh"
  }

}

resource "aws_security_group" "vpc_nat" {
  name        = "vpc_nat"
  description = "allow http(s) traffic from vpc to internet"
  vpc_id      = "${aws_vpc.default.id}"

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "nat"
  }
}

resource "aws_security_group" "bosh" {
  name        = "bosh"
  description = "allow connection between all bosh instances"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  tags {
    Name = "bosh"
  }
}
