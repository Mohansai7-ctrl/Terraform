#creating ec2_instance first

resource "aws_instance" "terraform" {
    ami = data.aws_ami.environment.id
    instance_type = var.instance_type
    count = length(var.instance_names)
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]   #should not give in quoted
        }
    )
}


resource "aws_security_group" "allow-ssh" {
    name = var.sg_name
    description = var.sg_description
    

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
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