variable "sg_name" {
    type = string
    sensitive = false
    default = "allow-ssh"
}

variable "common_tags" {
    type = map(string)
    sensitive = true
    default = {
        Project = "server"
        Environment = "dev"
        Terraform = true
    }
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

variable "instance_names" {
    type = list(string)
    default = ["mysql","frontend","backend"]
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "domain_id" {
    type = string
    default = "mohansai.online"
}