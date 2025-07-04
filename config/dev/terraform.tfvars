aws_region                        = "us-east-1"
environment_tag                   = "DEV"
prometheus_workspace_alias        = "jenkins-monitoring"
iam_grafana_role_name             = "GrafanaWorkspaceRole"
grafana_workspace_name            = "JenkinsMonitoringWorkspace"
grafana_workspace_description     = "Workspace for monitoring Jenkins using Grafana"
grafana_workspace_version         = "10.4"
account_access_type               = "CURRENT_ACCOUNT"
authentication_provider           = ["AWS_SSO"] # Now its called AWS IAM Identity Center
permission_type                   = "SERVICE_MANAGED"
grafana_role_type                 = "ADMIN"
grafana_datasources               = ["PROMETHEUS"]
grafana_folder_name               = "Jenkins Monitoring"
iam_user_id                       = ["2235b4c4-2031-7025-3522-8acaf2484b34"]
grafana_service_account_name      = "Jenkins Service Account Auth"
grafana_service_account_role_type = "ADMIN"
service_account_token_name        = "TerraformJenkins"
