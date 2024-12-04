module "vpc1" {
  source = "../vpc-module"
  region = "us-west-1"

  availability_zone = {
    private_subnet_az = "us-west-1c"
    public_subnet_az  = "us-west-1a"
  }

  cidr_block                = "10.0.0.0/16"
  vpc_name                  = "alex-my-vpc"
  public_subnet_cidr_block  = "10.0.1.0/24"
  private_subnet_cidr_block = "10.0.2.0/24"
  ami_image                 = "ami-0da424eb883458071"
  instance_type             = "t2.micro"
}