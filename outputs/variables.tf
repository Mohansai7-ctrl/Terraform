variable "instance_names" {
    type = list(string)
    default = ["mysql","frontend","backend"]
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