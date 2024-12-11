# Create IAM User
resource "aws_iam_user" "user" {
  name = var.user_name
  tags = {
    Name = var.user_name
  }
}

# Create IAM Group
resource "aws_iam_group" "group" {
  name = var.group_name
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = "A test policy"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:ListBucket"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach IAM Policy to User
resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}

# Attach IAM Policy to Group
resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}

# Add User to Group
resource "aws_iam_group_membership" "group_membership" {
  name = "${var.group_name}-membership"
  users = [
    aws_iam_user.user.name
  ]
  group = aws_iam_group.group.name
}
