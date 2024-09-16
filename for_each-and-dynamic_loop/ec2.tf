resource "aws_security_group" "allow-ssh" {
    name = "allow-ssh"
    description = "allowing port22 via ssh protocol"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }



    dynamic "ingress" {     #use of dynamic loop for_each with content and variable

        for_each = var.ingress_info
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
            ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"]

        }
        

    }

    tags = {
        Name = "allow-ssh"
    }

}

resource "aws_instance" "expense" {
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    for_each = var.instance_type
    instance_type = each.value
    tags = {
        Name = each.key
    }

    # connection {
    #     user = "ec2-user"
    #     password = "DevOps321"
    #     host = self.public_ip
    #     type = "ssh"
    # }

    # provisioner "remote-exec" {
    #     inline = [
    #         "sudo dnf install nginx",
    #         "sudo systemctl start nginx"
    #     ]
    # }
}