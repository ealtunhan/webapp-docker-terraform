variable "instance_type" {
  default = "t2.micro"
}
variable "region" {
  default = "ca-central-1"
}
variable "mykey" {
  default = "eric-keypair"  
}
variable "myami" {
  default = "ami-0d04e6652cb408e57"
}
variable "tag" {
  default = "web_server"
}
variable "web-sg" {
  default = "web-server-sec-gr-208"
}

variable "user" {
  default = "EricA"  
}

variable "connection_type" {
  default = "ssh"  
}