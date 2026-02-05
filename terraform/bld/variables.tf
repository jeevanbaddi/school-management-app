variable "project_id" {
  description = "GCP project ID"
}

variable "region" {
  description = "GCP region"
}

variable "env" {
  description = "Environment name"
}

variable "service_accounts" {
  description = "Service accounts and their IAM roles"
  type = map(object({
    roles = list(string)
  }))
}

variable "buckets" {
  description = "GCS buckets for school-app"
  type = map(object({
    location       = string
    versioning     = bool
    lifecycle_days = number
    iam_roles      = list(string)
    labels         = map(string)
  }))
}

# vm instances

variable "zone" {}
variable "instances" {
  type = map(object({
    machine_type = string
    image        = string
    network      = string
  }))
}

# GKE cluster
variable "zone1" {}
variable "cluster_name" {}
variable "node_count" {}
variable "machine_type" {}

# vpc networking

variable "vpc_name" {
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

