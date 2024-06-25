locals {
  common_tags = var.common_tags
}

resource "aws_instance" "ubuntu" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  subnet_id = var.subnet_id

  tags = merge(
    var.common_tags,
    {
      "Name" = "Project-akshaya"
    }
  )
}