variable "private_subnets" {
  type = list(string)
}

variable "db_sg" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_pass" {
  type = string
}

variable "db_name" {
  type = string
}