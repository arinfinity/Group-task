variable "user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "my-iam-user"
}

variable "group_name" {
  description = "The name of the IAM group"
  type        = string
  default     = "my-iam-group"
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
  default     = "my-iam-policy"
}
