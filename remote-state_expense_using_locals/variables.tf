variable "sg_name" {
    type = string
    default = "allow-ssh"
}

variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "environment" {
    type = string
    default = "prod"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "common_tags" {
    type = map(string)
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = true
    }
}