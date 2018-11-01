resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "rajesh_vpc"
  }
  tags {
    environment = "development"
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnet_a_cids}"
  availability_zone       = "${var.zone_a}"
  map_public_ip_on_launch = false

  tags {
    Name = "rajesh_public_subnet_a"
  }
  tags {
    environment = "development"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.private_subnet_a_cids}"
  availability_zone       = "${var.zone_a}"

  tags {
    Name = "rajesh_private_subnet_a"
  }
  tags {
    environment = "development"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "rajesh_internet_gateway"
  }
  tags {
    environment = "development"
  }

}

resource "aws_route_table" "public_routetable" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    Name = "rajesh_public_routetable"
  }
  tags {
    environment = "development"
  }
}

resource "aws_route_table_association" "public_subnet_a" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.public_routetable.id}"
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public_subnet_a.id}"

  tags {
    Name = "rajesh_nat_gateway"
  }
  tags {
    environment = "development"
  }
}

resource "aws_route_table" "private_routetable" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
  }

  tags {
    Name = "rajesh_private_routetable"
  }
  tags {
    environment = "development"
  }
}

resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = "${aws_subnet.private_subnet_a.id}"
  route_table_id = "${aws_route_table.private_routetable.id}"
}
