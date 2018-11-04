resource "aws_vpc" "v" {
  cidr_block = "${var.cidr_block}"
}

resource "aws_internet_gateway" "i" {
  vpc_id = "${aws_vpc.v.id}"
}

resource "aws_default_route_table" "r" {
  default_route_table_id = "${aws_vpc.v.main_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.i.id}"
  }
}
