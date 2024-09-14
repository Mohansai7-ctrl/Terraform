resource "aws_instance" "terraform" {
    instance_type = "t3.micro"
    ami = data.aws_ami.ami_info.id
    count = length(var.instance_names)
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    tags = {
        Name = var.instance_names[count.index]
    }
}



resource "aws_security_group" "allow-ssh" {
    name = var.sg_name
    description = "Allowing port 22 via ssh protocol"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge(
        var.common_tags,
        {
            Name = "allow-ssh"
        }
    )


}

#if environment is prod then create another instance
resource "aws_instance" "another_instance" {
    
    instance_type = local.instance_type
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    tags = merge(
        var.common_tags,
        {
            Name = "terraform"
        }
    )

    }