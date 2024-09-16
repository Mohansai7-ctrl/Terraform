variable "instance_type" {
    type = map(string)
    default = {
        mysql = "t3.micro"
        backend = "t2.micro"
        frontend = "t2.micro"
    }
}

variable "ingress_info" {
    
    default = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

    ]
}

variable "domain_name" {
    default = "mohansai.online"
}