resource "aws_subnet" "StudentPlacement-Frankfurt-communication-subnet-1a" {
  vpc_id     = aws_vpc.StudentPlacement-Frankfurt-vpc.id
  cidr_block = "172.24.15.128/27"
  map_public_ip_on_launch = false
  availability_zone = "eu-central-1a"

  tags = {
    Name = "StudentPlacement-Frankfurt-communication-subnet-1a"
  }
}

resource "aws_route_table" "StudentPlacement-Frankfurt-communication-subnet-1a-router" {
  vpc_id = aws_vpc.StudentPlacement-Frankfurt-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
  }

   tags = {
   Name = "StudentPlacement-Frankfurt-communication-subnet-1a-router"
  }
}

resource "aws_route_table_association" "StudentPlacement-Frankfurt-communication-subnet-1a-association" {
  subnet_id      = aws_subnet.StudentPlacement-Frankfurt-communication-subnet-1a.id
  route_table_id = aws_route_table.StudentPlacement-Frankfurt-communication-subnet-1a-router.id
}