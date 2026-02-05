variable "project_id" {
 type = string
}

variable "zone" {
    type = string
}

variable "env" {
    type = string
}

variable "instances" {
    description = "map of vm instances"
    type = map(object({
    machine_type = string
    image        = string
    network      = string
    }))
}