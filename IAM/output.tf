output "user_name" {
  value = aws_iam_user.user.name
}

output "group_name" {
  value = aws_iam_group.group.name
}

output "policy_arn" {
  value = aws_iam_policy.policy.arn
}
