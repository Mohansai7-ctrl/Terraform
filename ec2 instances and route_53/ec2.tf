#creating security_group first

resource "aws_security_group" "allow-ssh" {
    name = var.sg_name
    description = "allowing port 22 network via ssh protocol"
    tags = merge(
        var.common_tags,
            {
                Name = "allow-ssh"
            }
            )
    
            
    

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
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]

    }
}


#creating ec2 instance
resource "aws_instance" "server" {
    count = length(var.instance_names)
    ami = data.aws_ami.joindevops.id
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    instance_type = var.instance_type
    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}

#creating route53 private ip address