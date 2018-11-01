variable "aws_region" {
    type        = "string"
    default     = "us-east-1"
}

variable "vpc_cidr" {
      type        = "string"
    default     = "10.0.0.0/16"
}
variable "public_subnet_a_cids" {
      type        = "string"
    default     = "10.0.0.0/24"
}
variable "private_subnet_a_cids" {
      type        = "string"
    default     = "10.0.1.0/24"
}
variable "zone_a" {
      type        = "string"
    default     = "us-east-1a"
}

variable "ec2_ami" {
      type        = "string"
    default     = "ami-013be31976ca2c322"
}

variable "keypair_name" {
      type        = "string"
    default     = "rreddy"
}
