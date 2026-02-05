variable "vpc_name" {
  type = string
}

variable "region" {
  type = string
}

variable "subnets" {
  type = map(object({
    cidr = string
  }))
}

variable "firewall_rules" {
  type = map(object({
    protocol       = string
    ports          = list(string)
    source_ranges  = list(string)
  }))
}
