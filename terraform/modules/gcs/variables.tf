variable "project_id" {}
variable "env" {}

variable "buckets" {
  description = "GCS buckets for the application"
  type = map(object({
    location       = string
    versioning     = bool
    lifecycle_days = number
    iam_roles      = list(string)
    labels         = map(string)
  }))
}

variable "service_account_email" {
  description = "Service account that needs access to buckets"
}
