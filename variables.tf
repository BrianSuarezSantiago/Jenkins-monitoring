# General variables
variable "aws_region" {
  description = "AWS region where resources will be deployed"
}

# Prometheus specific variables
variable "prometheus_workspace_alias" {
  description = "AWS Managed Service for Prometheus workspace name"
}

variable "environment_tag" {
  description = "Environment where the AMP will be deployed"
}

# Grafana specific variables

variable "grafana_workspace_name" {
  description = "Name of the Amazon Managed Service for Grafana (AMG) workspace"
}

variable "grafana_workspace_description" {
  description = "Description of the Amazon Managed Service for Grafana (AMG) workspace"
}

variable "grafana_workspace_version" {
  description = "Version of the Grafana workspace to be created (e.g., 9.4)"
}

variable "account_access_type" {
  description = "Type of account access for the Grafana workspace (e.g., CURRENT_ACCOUNT or ORGANIZATION)"
}

variable "authentication_provider" {
  description = "Authentication provider for Grafana (e.g., AWS_SSO, SAML, or IAM)"
}

variable "permission_type" {
  description = "Permission type for Grafana workspace (e.g., SERVICE_MANAGED or CUSTOMER_MANAGED)"
}

variable "grafana_role_type" {
  description = "Type of role to be associated with the Grafana workspace (e.g., ADMIN, EDITOR, VIEWER)"
}

# IAM role for Grafana
variable "iam_grafana_role_name" {
  description = "Name of the IAM role to be created for Grafana workspace"
}