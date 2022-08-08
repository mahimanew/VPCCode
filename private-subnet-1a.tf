resource "aws_subnet" "StudentPlacement-Frankfurt-private-subnet-1a" {
  vpc_id     = aws_vpc.StudentPlacement-Frankfurt-vpc.id
  cidr_block = "172.24.12.0/25"
  map_public_ip_on_launch = false
  availability_zone = "eu-central-1a"

  tags = {
    Name = "StudentPlacement-Frankfurt-private-subnet-1a"
  }
}

resource "aws_route_table" "StudentPlacement-Frankfurt-private-subnet-1a-router" {
  vpc_id = aws_vpc.StudentPlacement-Frankfurt-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.StudentPlacement-Frankfurt-nat-Gateway.id
  }

   tags = {
   Name = "StudentPlacement-Frankfurt-private-subnet-1a-router"
  }
}

resource "aws_route_table_association" "StudentPlacement-Frankfurt-private-1a-association" {
  subnet_id      = aws_subnet.StudentPlacement-Frankfurt-private-subnet-1a.id
  route_table_id = aws_route_table.StudentPlacement-Frankfurt-private-subnet-1a-router.id
}