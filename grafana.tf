# Creates an Amazon Managed Service for Grafana (AMG) workspace
resource "aws_grafana_workspace" "grafana_workspace" {
  # Si ha fallado una ejecución anterior con la misma combinación de nombre/descripción, falla -> https://stackoverflow.com/questions/73214759/grafana-workspace-conflictexception-duplicate-request-for-workspace
  # Para evitar esto, se añade un timestamp a la descripción
  name                     = var.grafana_workspace_name
  description              = var.grafana_workspace_description
  grafana_version          = var.grafana_workspace_version
  account_access_type      = var.account_access_type
  authentication_providers = var.authentication_provider
  permission_type          = var.permission_type
  role_arn                 = aws_iam_role.iam_grafana_role.arn
  data_sources             = ["PROMETHEUS"]

  tags = {
    Environment = var.environment_tag
  }

  depends_on = [
    aws_iam_role.iam_grafana_role
  ]
}

# Associates a role with the Grafana workspace
# The role must be created before this association can be made
resource "aws_grafana_role_association" "grafana_role" {
  role         = var.grafana_role_type
  user_ids     = ["2235b4c4-2031-7025-3522-8acaf2484b34"]
  workspace_id = aws_grafana_workspace.grafana_workspace.id
}
