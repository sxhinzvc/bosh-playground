variable "access_key" {}
variable "secret_key" {}
variable "ssh_private_key" {}
variable "region" {
  default = "us-east-1"
}
variable "vpc_gw" {
  default = "10.0.0.1"
}
variable "bosh_gw" {
  default = "10.0.1.1"
}
variable "bosh_ip" {
  default     = "10.0.1.6"
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
}

variable "bosh_subnet_cidr" {
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  default     = "10.0.0.0/24"
}
variable "amis" {
  description = "Base AMI to launch the vms"
  default = "ami-66506c1c"
}
variable "jumpbox_ssh_user" {
  default = "ubuntu"
}
