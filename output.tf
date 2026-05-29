output "aws_ec2_instance_public_ip" {
    value = aws_instance.terraform_demo.public_ip
    description = "Public IP address of the EC2 instance"
}

output "aws_ec2_instance_id" {
    value = aws_instance.terraform_demo.id
    description = "ID of the EC2 instance"
}

output "aws_security_group_id" {
    value = aws_security_group.terraform_sg.id
    description = "ID of the security group"
}

output "aws_ebs_volume_id" {
    value = aws_ebs_volume.terraform_volume.id
    description = "ID of the EBS volume"
}

output "aws_volume_attachment_id" {
    value = aws_volume_attachment.terraform_volume_attachment.id
    description = "ID of the volume attachment"
}