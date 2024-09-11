#security_group

resource "aws_security_group" "allow_ssh" {
    name = "allow-ssh"
    description = " This will create the security group with security group name as allow-ssh"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0./0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-ssh"
    }

}


resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type == prod ? "t2.micro" : "t3.micro"  #condition, as var.instance_type is dev, condition will fails and it takes t3.micro
    tags = {
        Name = "terraform"
    }
}
