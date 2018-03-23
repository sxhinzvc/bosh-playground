resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_eip" "nat" {
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.public.id}"
}

resource "aws_eip_association" "nat_eip_association" {
  instance_id = "${aws_nat_gateway.nat.id}"
  allocation_id = "${aws_eip.nat.id}"
}
