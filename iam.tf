resource "aws_iam_role" "iam_grafana_role" {
  name = var.iam_grafana_role_name

  # Terraform's "jsonencode" function converts a Terraform expression result to valid JSON syntax
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = var.environment_tag
    Workspace   = var.grafana_workspace_name
  }
}
