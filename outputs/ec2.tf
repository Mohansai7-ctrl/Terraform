# #creating ec2 instance 
# creating security group first and then will create ec2_instance to which security group will be added

resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow-ssh"  #This is just Security_group name only
    description = "allowing port 22 via ssh protocol"
    tags = {  #it will add name tag as Security_group and Name tag both are different
        Name = "allow-ssh"
    }

    egress {   # name and {} this is block
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

        
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }

}


#creating ec2_instances:

resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    instance_type = "t3.micro"
    tags = {   #it will add Name tag  #name = {} map/ tag, so that it will add name
        Name = "terraform"
    }


}