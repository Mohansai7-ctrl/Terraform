variable "sg_name" {
    default = "allow-ssh"
    type = string
    description = "security gropup name"
}

variable "sg-description" {
    type = string
    default = "This is to create secruity_group name"
}

variable "from_port" {
    default = "22"
    type = number
}

variable "to_port" {
    type = number
    default = 22

}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "icdr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}


#now related to ec2_instance


variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "tags" {
    type = map
    default = {
        Name = "server"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = true

    }
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}