variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "instance_names" {
    type = list(string)
    default = ["mysql","backend","frontend"]
}

variable "common_tags" {
    type = map(string)
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = true
    }
}

variable "sg_name" {
    type = string
    default = "allow-ssh"
}

variable "sg_description" {
    type = string
    default = "allowing port 22 network via ssh protocol"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "domain_name" {
    type = string
    default = "mohansai.online"
}