# Creates an Amazon Managed Service for Grafana (AMG) workspace
resource "aws_grafana_workspace" "grafana_workspace" {
  name = var.grafana_workspace_name
  account_access_type      = var.account_access_type
  authentication_providers = var.authentication_provider
  permission_type          = var.permission_type
  role_arn                 = aws_iam_role.iam_grafana_role.arn

  depends_on = [
    aws_iam_role.iam_grafana_role
  ]
}

# Associates a role with the Grafana workspace
# The role must be created before this association can be made
resource "aws_grafana_role_association" "grafana_role" {
  role         = var.grafana_role_type
  workspace_id = aws_grafana_workspace.grafana_workspace.id

  depends_on = [
    aws_grafana_workspace.grafana_workspace
  ]
}