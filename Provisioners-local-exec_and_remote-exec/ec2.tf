resource "aws_security_group" "allow-ssh" {
    name = "allow-ssh"
    description = "allowing port22 via ssh protocol"

    tags = {
        Name = "allow-ssh"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    dynamic "ingress" {
        for_each = var.ingress_info
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]

        }
    }
}


resource "aws_instance" "expense" {
    ami = data.aws_ami.ami_info.id
    for_each = var.instance_type
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    tags = {
        Name = each.key
    }

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > private_ip.txt"
    }

    #for remote-exec, it need connection block, this will install nginx server in all 3 created ec2_instances or servers
    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
}