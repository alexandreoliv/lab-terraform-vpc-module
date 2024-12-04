variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "public_subnet_cidr_block" {
  type        = string
  default     = "10.1.0.0/24"
  description = "CIDR range for public subnet"
}

variable "private_subnet_cidr_block" {
  type        = string
  default     = "10.2.0.0/24"
  description = "CIDR range for private subnet"
}

variable "region" {
  type        = string
  default     = "us-west-1"
  description = "Default region where infrastructures will be provisioned"
}

variable "availability_zone" {
  type = map(string)
  default = {
    private_subnet_az = "us-west-1c"
    public_subnet_az  = "us-west-1a"
  }
}

variable "ami_image" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
