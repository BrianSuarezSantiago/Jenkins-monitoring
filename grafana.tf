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
  data_sources             = var.grafana_datasources

  tags = {
    Environment = var.environment_tag
  }

  depends_on = [
    aws_iam_role.iam_grafana_role
  ]
}

# Associates a role (IAM Identity Center user) with the Grafana workspace
# The role must be created before this association can be made
resource "aws_grafana_role_association" "grafana_role" {
  role         = var.grafana_role_type
  user_ids     = var.iam_user_id
  workspace_id = aws_grafana_workspace.grafana_workspace.id
}

# Creates a Grafana data source for Prometheus


# Creates a Grafana folder within the workspace
resource "grafana_folder" "grafana_folder_creation" {
  title                        = var.grafana_folder_name
  prevent_destroy_if_not_empty = var.prevent_destroy_if_not_empty
}

# Creates a Grafana dashboard within the specified folder


# Creates a Grafana workspace service account with 'admin' privileges
resource "aws_grafana_workspace_service_account" "grafana_service_account" {
  name         = var.grafana_service_account_name
  grafana_role = var.grafana_service_account_role_type
  workspace_id = aws_grafana_workspace.grafana_workspace.id
}

# Creates a service account token for the Grafana service account
resource "aws_grafana_workspace_service_account_token" "example" {
  name               = "example-key"
  service_account_id = aws_grafana_workspace_service_account.example.service_account_id
  seconds_to_live    = 3600
  workspace_id       = aws_grafana_workspace.example.id
}