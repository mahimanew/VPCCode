resource "aws_vpc" "StudentPlacement-Frankfurt-vpc" {
  cidr_block = "172.24.0.0/22"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
    
  tags = {
    Name = "StudentPlacement-Frankfurt-vpc"
  }
}
