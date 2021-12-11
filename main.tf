provider "aws" {
    region = "us-east-1"
    access_key = "AKIAUL4VP7XZISSAE4X2"
    secret_key = "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"

}

resource "aws_vpc" "testing-vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
      Name : var.cidr_blocks[0].name
  }
}

variable "cidr_blocks" {
    description = "cidr block for subnet"
    #default = "10.2.20.0/24"
    type = list(object({
        cidr_block = string
        name = string
    }))
  
}


resource "aws_subnet" "testing-subnet" {
    vpc_id = aws_vpc.testing-vpc.id
    cidr_block = var.cidr_blocks[1].cidr_block
    availability_zone = "us-east-1a"
    tags = {
      Name : var.cidr_blocks[1].name
  }
}


# data "aws_vpc" "prod-vpc" {
#    default = true
  
# }

# resource "aws_subnet" "imported-subnet" {
#     vpc_id = data.aws_vpc.prod-vpc.id
#     cidr_block = "172.31.20.0/24"
#     availability_zone =  "us-east-1a"
#     tags = {
#       Name : "imported-subnet-1"

#   }
# }