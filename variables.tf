# General variables
variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

variable "environment_tag" {
  description = "Environment where the resource will be deployed"
  type        = string
}

# Prometheus specific variables
variable "prometheus_workspace_alias" {
  description = "AWS Managed Service for Prometheus workspace name"
  type        = string
}

# IAM role for Grafana
variable "iam_grafana_role_name" {
  description = "Name of the IAM role to be created for Grafana workspace"
  type        = string
}

# Grafana specific variables
variable "grafana_workspace_name" {
  description = "Name of the Amazon Managed Service for Grafana (AMG) workspace"
  type        = string
}

variable "grafana_workspace_description" {
  description = "Description of the Amazon Managed Service for Grafana (AMG) workspace"
  type        = string
}

variable "grafana_workspace_version" {
  description = "Version of the Grafana workspace to be created (e.g., 9.4)"
  type        = string
}

variable "account_access_type" {
  description = "Type of account access for the Grafana workspace (e.g., CURRENT_ACCOUNT or ORGANIZATION)"
  type        = string
}

variable "authentication_provider" {
  description = "Authentication provider for Grafana (e.g., AWS_SSO, SAML, or IAM)"
  type        = list(string)
}

variable "permission_type" {
  description = "Permission type for Grafana workspace (e.g., SERVICE_MANAGED or CUSTOMER_MANAGED)"
  type        = string
}

variable "grafana_role_type" {
  description = "Type of role to be associated with the Grafana workspace (e.g., ADMIN, EDITOR, VIEWER)"
  type        = string
}

variable "grafana_datasources" {
  description = "List of data sources to be configured in the Grafana workspace"
  type        = list(string)
}

variable "grafana_folder_name" {
  description = "Name of the Grafana folder to be created within the workspace"
  type        = string
}

variable "prevent_destroy_if_not_empty" {
  description = "Prevent destruction of the Grafana folder if it is not empty"
  type        = bool
  default     = true
}

variable "iam_user_id" {
  description = "List of IAM Identity Center user IDs to be associated with the Grafana workspace. It gives access to the Grafana workspace"
  type        = list(string)
}

variable "grafana_service_account_name" {
  description = "Name of the Grafana service account to be created within the workspace"
  type        = string
}

variable "grafana_service_account_role_type" {
  description = "Role type for the Grafana service account (e.g., ADMIN, EDITOR, VIEWER)"
  type        = string
}