provider "aws" {
 region = "ap-southeast-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0d07675d294f17973"
    instance_type = "t2.micro"
    key_name = "valaxykey"
 
} 