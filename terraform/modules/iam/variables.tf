variable "project_id" {}
variable "env" {}

variable "service_accounts" {
  type = map(object({
    roles = list(string)
  }))
}
