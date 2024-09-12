# # #creating ec2 instance 
# # creating security group first and then will create ec2_instance to which security group will be added


resource "aws_security_group" "allow_ssh" {
    name = "allo-ssh"
    description = "This will allows port 22 traffice via ssh protocol"
    # ami = var.ami_id
    # vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "allow-ssh"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_instance" "expense" {
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t3.micro"
    count = length(var.instance_names)
    tags = {
        Name = var.instance_names[count.index]
    }

}



















































































# resource "aws_security_group" "allow_ssh_terraform" {
#     name = "allow-ssh"  #This is just Security_group name only
#     description = "allowing port 22 via ssh protocol"
#     tags = {  #it will add name tag as Security_group and Name tag both are different
#         Name = "allow-ssh"
#     }

#     egress {   # name and {} this is block
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]

        
#     }

#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]

#     }

# }


# #creating ec2_instances:

# resource "aws_instance" "terraform" {
#     ami = "ami-09c813fb71547fc4f"
#     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
#     instance_type = "t3.micro"
#     tags = {   #it will add Name tag  #name = {} map/ tag, so that it will add name
#         Name = "terraform"
#     }


# }

# resource "aws_route53_zone" "primary" {
#     name = mohansai.online
# }

# resource "aws_eip" "lb" {
#     instance = aws_instance.terraform.id
# }


# resource "aws_route53_record" "dns" {
#   zone_id = aws_route53_zone.primary.zone_id
#   name    = "dns.mohansai.com"
#   type    = "A"
#   ttl     = 1
#   records = [aws_eip.lb.public_ip]
# }













