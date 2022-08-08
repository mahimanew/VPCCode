resource "aws_internet_gateway" "StudentPlacement-Frankfurt-IG" {
  vpc_id = aws_vpc.StudentPlacement-Frankfurt-vpc.id

  tags = {
    Name = "StudentPlacement-Frankfurt-IG"
  }
}

resource "aws_nat_gateway" "StudentPlacement-Frankfurt-nat-Gateway" {
  allocation_id = "${aws_eip.StudentPlacement-Frankfurt-eip-a.id}"
  subnet_id     = "${aws_subnet.public-subnet-1a.id}"
 tags ={
          Name = "StudentPlacement-Frankfurt-nat-Gateway"
      }
}

resource "aws_eip" "StudentPlacement-Frankfurt-eip-a" {
  vpc      = true
}