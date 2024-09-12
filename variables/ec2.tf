# #creating ec2 instance 
# creating security group first and then will create ec2_instance to which security group will be added

resource "aws_security_group" "allow_ssh_terraform" {
    name = var.sg_name  #This is just Security_group name only
    description = var.sg_description
    tags = merge(               #merge(list1,list2)
        var.common_tags,
        {
            Name = "allow-ssh"
        }
    )

    egress {   # name and {} this is block
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

        
    }

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]

    }

}


#creating ec2_instances:

resource "aws_instance" "terraform" {
    ami = var.ami_id 
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    instance_type = var.instance_type
    tags = merge(
        {
            Name = "terraform"
        },var.common_tags,

    )


}