
provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "mohan_terraform_sg" {
    name        = "mohan_terraform_security_group"
    description = "Security group for mohan_terraform_demo instance"
    vpc_id      = "vpc-09675635bce85b531"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port  = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "mohan_terraform_demo" {
    ami          = "ami-0b183bb1259186479"
    instance_type = "t4g.small"
    key_name     = "terraform-demo"
    vpc_security_group_ids = [aws_security_group.mohan_terraform_sg.id]
    subnet_id = "subnet-05db414ebc6d87bdd"
    associate_public_ip_address = true

    tags = {
        Name = "TerraformDemoInstance"
        Environment = "Terraform-Demo"

    }
}

resource "aws_ebs_volume" "terraform_volume" {
    availability_zone = "us-east-1a"
    size              = 10
    type              = "gp3"
    tags = {
        Name = "TerraformDemoVolume"
        Environment = "Terraform-Demo"
    }
}


resource "aws_volume_attachment" "terraform_volume_attachment" {
    device_name = "/dev/sdf"
    volume_id   = aws_ebs_volume.terraform_volume.id
    instance_id = aws_instance.mohan_terraform_demo.id
}