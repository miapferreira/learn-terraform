variable "region" {
  description = "The default region"
  default     = "us-east-1"
}

variable "ami" {
  default = "ami-0080e4c5bc078760e"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair" {
  default = "linux"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "volume_type" {
  description = "The type of volume. Can be 'standard', 'gp2', 'io1', 'sc1', or 'st1'"
  type        = string
  default     = "gp2"
}

variable "disk_size" {
  description = "The size of the root volume in gigabytes."
  type        = string
  default     = "11"
}

variable "tags" {
  default = {
    Name    = "Estudos"
    Product = "Terraform"
    Owner   = "Public"
  }
}

variable "environment" {
  description = "The information of environment"
  type        = string
  default     = "production"
}

variable "production" {
  description = "The information of environment"
  type        = string
  default     = true
}

variable "services_ports" {
  description = "Allow specifcs ports "
  type        = list
  default     = ["80", "443", "22", "7937"]
}

variable "services_ip" {
  description = "Allow specifcs IPs "
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "security_group" {
  description = "Value of Security group "
  type        = string
  default     = "sg-72cadc29"
}

variable "name" {
  type    = string
  default = "michel"
}